<?php
class Menu {
  function setPage($page_slug){
    $this->currentPage = $page_slug;
    return    $this;
  }
  function setItems($items){
    if(!is_array($items)){
      return false;
    }
    $this->items = $items;
  }
  function output(){
    foreach ($this->items as &$item) {
      if($item['slug'] == $this->currentPage){
        $item['activ'] = true;
      }
    }
    return $this->items;
  }
}
