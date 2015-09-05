<?php
error_reporting(E_ALL);
ini_set('displat_errors', 'On');
include('classes/bootloader.php');
$f3=require('lib/base.php');

$f3->set('DEBUG',1);

$f3->config('config.ini');

$f3->menu = new Menu();
$menuItems = array();
$menuItems[] = array('slug' => 'dashboard','name' => 'Dashboard');
$menuItems[] = array('slug' => 'devices','name' => 'Devices');
$menuItems[] = array('slug' => 'settings','name' => 'Settings');
$f3->menu->setItems($menuItems);

$f3->db = new DB\SQL(
    'mysql:host=localhost;port=3306;dbname=logginator',
    'root',
    ''
);

$f3->route('GET /',
	function($f3) {
		$f3->reroute('dashboard');
	}
);



$f3->route('GET /dashboard',
	function($f3) {
		$items = $f3->menu->setPage('dashboard')->output();
		$f3->set('items',$items);
		$f3->set('content','dashboard.htm');
		$template=new Template;
		echo $template->render('layout.htm');
	}
);

$f3->route('GET /devices',
	function($f3) {
		$results = $f3->db->exec('SELECT * FROM devices');
		foreach ($results as &$device) {
				$device['alive'] = (strtotime($device['lasttimeonline']." GMT+03:00") > (time() -20)) ? 'alive' : 'dead';
		}
		$items = $f3->menu->setPage('devices')->output();
		$f3->set('items',$items);
		$f3->set('results',$results);
		$f3->set('pageMenu','devices-menu.htm');
		$f3->set('content','devices.htm');
		$template=new Template;
		echo $template->render('layout.htm');
	}
);

$f3->route('GET /settings',
	function($f3) {



		$items = $f3->menu->setPage('settings')->output();
		$f3->set('items',$items);
		$f3->set('content','settings.htm');
		$template=new Template;
		echo $template->render('layout.htm');
	}
);

$f3->route('GET /device/@guid',
	function($f3, $params) {
		if(strlen($params['guid']) != 32){
			return false;
		}
		$device = $f3->db->exec('SELECT * FROM `devices` where `guid`=:guid', array(':guid'=>$params['guid']));
		if(isset($device[0])){
			$device = $device[0];
		}else{
			return false;
		}
		$items = $f3->menu->setPage('devices')->output();
		$f3->set('items',$items);
		$f3->set('device',$device);
		$f3->set('pageMenu','devices-menu.htm');
		$f3->set('content','device.htm');
		$template=new Template;
		echo $template->render('layout.htm');
	}
);

$f3->route('GET|POST /api/@guid/@apikey/@keyword',
	function($f3, $params) {
		header('Content-type: application/json');
		$response = array('status' =>'', 'message' =>'');
		if(strlen($params['guid']) != 32){
			$response['status'] = 'failed';
			$response['message'] = 'invalid guid, must be 32 chars long';
			echo json_encode($response);
			return false;
		}
		if(strlen($params['apikey']) != 32){
			$response['status'] = 'failed';
			$response['message'] = 'invalid apikey, must be 32 chars long';
			echo json_encode($response);
			return false;
		}
		if(strlen($params['keyword']) < 3){
			$response['status'] = 'failed';
			$response['message'] = 'please set a keyword, you can use the "general" keyword';
			echo json_encode($response);
			return false;
		}
		$rows = $f3->db->exec("SELECT * FROM `devices` WHERE `apikey`=:apikey   AND `guid`=:guid", array(':apikey' => $params['apikey'], ':guid' => $params['guid']));
		if(isset($rows[0])){
			$device = $rows[0];
		}else{
			$response['status'] = 'failed';
			$response['message'] = 'invalid apikey or guid';
			echo json_encode($response);
			return false;
		}
		if($f3->get('VERB') == 'GET'){
			$param = array();
			$param[':guid'] = $params['guid'];
			$param[':keyword'] = $params['keyword'];
			$param[':mempeak'] = @$_GET['mempeak'];
			$param[':data'] = '"ping"';
			$f3->db->exec("INSERT INTO `logs` (`guid`, `timestamp`, `keyword`, `mempeak`, `data`) values (:guid, now(), :keyword, :mempeak, :data )",$param);
			$response['status'] = 'success';
			$response['message'] = 'pong';
		}elseif($f3->get('VERB') == 'POST'){
			$param = array();
			$param[':guid'] = $params['guid'];
			$param[':keyword'] = $params['keyword'];
			$param[':mempeak'] = @$_GET['mempeak'];
			$param[':data'] = isset($_POST['data'])? $_POST['data'] : json_encode($_POST) ;
			$f3->db->exec("INSERT INTO `logs` (`guid`, `timestamp`, `keyword`, `mempeak`, `data`) values (:guid, now(), :keyword, :mempeak, :data )",$param);
			$response['status'] = 'success';
			$response['message'] = 'ty!';
		}
		$f3->db->exec('UPDATE `devices` SET `lasttimeonline`=now(), `ipaddress`=:ip WHERE `guid`=:guid', array(':ip'=>$f3->get('IP'), ':guid'=>$params['guid']));
		echo json_encode($response);
		return false;
	}
);
$f3->route('GET /api/logs/@guid/@last', function($f3, $params){
	header('Content-Type: application/json');
	$data =	$f3->db->exec("SELECT * FROM `logs` WHERE `guid`=:guid and `id`>:stamp order by id asc",array(':guid'=>$params['guid'], ':stamp'=>$params['last']));

	echo json_encode($data);

	return true;
});

$f3->route('GET|POST /device/add',function($f3){
  if($f3->get('VERB') == 'GET'){
    $items = $f3->menu->setPage('devices')->output();
    $f3->set('items',$items);
    $f3->set('device',$device);
    $f3->set('pageMenu','devices-menu.htm');
    $f3->set('content','device-add.htm');
    $template=new Template;
    echo $template->render('layout.htm');
  }else{
    
  }
});
$f3->run();
