<?php

require_once MODX_CORE_PATH . 'elements/classes/comparision.class.php';

$compare = new Comparision($modx, $_POST);
$result = $compare->init();
if($result['success']){
    return $AjaxFormitLogin->success($result['msg'], ['btn_text' => $result['btn_compare_text'], 'counts' => $result['counts']]);
}else{
    return $AjaxFormitLogin->error($result['msg'], []);
}
