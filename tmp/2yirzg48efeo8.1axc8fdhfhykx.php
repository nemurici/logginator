<div class="col-lg-12">
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Logginator</a>
      </div>
      <ul class="nav navbar-nav">
        <?php foreach (($items?:array()) as $key=>$value): ?>
              <li class="<?php echo $value['activ'] == 1?  'active': ''; ?>"><a href="/<?php echo $value['slug']; ?>"><?php echo $value['name']; ?></a></li>
        <?php endforeach; ?>
      </ul>
      <?php if ($pageMenu  != null) echo $this->render($pageMenu,$this->mime,get_defined_vars()); ?>
    </div>
  </nav>
</div>
