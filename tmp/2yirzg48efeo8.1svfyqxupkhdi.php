<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="<?php echo $ENCODING; ?>" />
		<title>Dashboard logger</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/ui/css/master.css" media="screen" title="custom css" charset="utf-8">
	</head>
	<body>
			<div class="container">
				<div class="row">
					<?php if (count($items) >= 1) echo $this->render('menu.htm',$this->mime,get_defined_vars()); ?>
					<div class="col-lg-12">
						<?php echo $this->render($content,$this->mime,get_defined_vars()); ?>
					</div>
				</div>
			</div>


			<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
			<script src="/ui/js/master.js" charset="utf-8"></script>
			<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
