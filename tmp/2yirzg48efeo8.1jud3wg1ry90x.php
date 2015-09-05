
<div class="devices container">
  <?php foreach (($results?:array()) as $item): ?>
    <div class="row device">
      <div class="col-lg-2 col-md-2 deviceName">
          <?php echo $item['name']; ?>

      </div>
      <div class="col-lg-7 col-md-7 deviceStatus">
      </div>
      <div class="col-lg-3 col-md-3 deviceLogs">
        <div class="col-lg-6">
          <?php echo $item['alive']; ?>

        </div>
        <div class="col-lg-6">
          <a href="device/<?php echo $item['guid']; ?>">
            <button type="button" name="button" class="btn btn-info" data-id="1">See logs</button>
          </a>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>
