<div class="container">
  <div class="row informations">
    <div class="col-lg-2 col-md-12 col-sm-12">
      NAME:<br>
      <?php echo $device['name']; ?>

    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      GUID:<br>
      <?php echo $device['guid']; ?>

    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      APIKEY:<br>
      <?php echo $device['apikey']; ?>

    </div>
    <div class="col-lg-2 col-md-4 col-sm-6">
      LAST TIME ONLINE:<br>
      <span id="lasttimeonline">
        <?php echo $device['lasttimeonline']; ?>

      </span>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-6">
      IP:<br>
      <?php echo $device['ipaddress']; ?>

    </div>
  </div>
  <div id="logs" class="logs">
  </div>
</div>
<script>
window.guid = '<?php echo $device['guid']; ?>';
 document.addEventListener("DOMContentLoaded",function(){
  window.logstemplate = '<div class="row"><hr><div class="col-lg-1 col-sm-3">%KEYWORD%</div><div class="col-lg-1 col-sm-3">%MEMPEAK%</div><div class="col-lg-2 col-sm-3">%TIMESTAMP%</div> <div class="col-lg-8 col-sm-12"> <pre>%DATA%</pre> </div></div>';
  start = 0;
  setInterval(function(){
    $.get('/api/logs/'+guid+'/'+start).done(function(data){
      for(itemkey in data){
      item = data[itemkey];
      $('#lasttimeonline').text(item.timestamp);
      start = item.id;
      prepare = window.logstemplate.replace('%KEYWORD%',item.keyword)
                                    .replace('%MEMPEAK%', item.mempeak)
                                    .replace('%TIMESTAMP%', item.timestamp)
                                    .replace('%DATA%', item.data);
      $('#logs').prepend(prepare);
      }
    })
  },1000)
});
</script>
