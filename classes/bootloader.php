<?php
include('loaderMenu.php');
$f3->host = $f3->get('HEADERS.Host');
$f3->menu = new Menu();
$menuItems = array();
$menuItems[] = array('slug' => 'dashboard','name' => 'Dashboard');
$menuItems[] = array('slug' => 'devices','name' => 'Devices');
$menuItems[] = array('slug' => 'settings','name' => 'Settings');
$f3->menu->setItems($menuItems);

$f3->db = new DB\SQL(
    'mysql:host='.$f3->get('MYSQLHOSTNAME').';port='.$f3->get('MYSQLPORT').';dbname='.$f3->get('MYSQLDATABASE'),
    $f3->get('MYSQLUSERNAME'),
    $f3->get('MYSQLPASSWORD')
);
