<?php
$modx->lexicon->load('minishop2:default');
if(!$ctx){
    $ctx = $modx->context->key;
}

if($lang_key = $modx->getPlaceholder("+lang")){
    $polylang = $modx->getService('polylang', 'Polylang');
}
$output = [];
if(!empty($_SESSION['compare'][$ctx])){
    $output = [
        'lists' => [],
        'products' => []
    ];

    foreach($_SESSION['compare'][$ctx] as $key => $list){

        if(!empty($list)){
            $output['lists'][] = $key;
            foreach ($list as $id => $v){
                if($product = $modx->getObject('msProduct', $id)){
                    $resource_data = $product->toArray();
                    if($lang_key && $polylang){
                        if ($polylangContent = $modx->getObject('PolylangContent', ['content_id' => $id, 'culture_key' => $lang_key])) {
                            $resource_data = array_merge($resource_data, $polylangContent->toArray());
                        }
                        if ($polylangOptions = $modx->getIterator('PolylangProductOption', ['content_id' => $id, 'culture_key' => $lang_key])) {
                            foreach($polylangOptions as $op){
                                $resource_data[$op->get('key')][0] = $op->get('value');
                            }
                        }
                    }

                    $output['products'][$key][] = $resource_data;
                }
            }
        }
    }
}
return $output;
