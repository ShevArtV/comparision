<?php
$modx->lexicon->load('minishop2:default');
$pdo = $modx->getService('pdoTools');
if(!$ctx){
    $ctx = $modx->context->key;
}

if($lang_key = $modx->getPlaceholder("+lang")){
    $polylang = $modx->getService('polylang', 'Polylang');
}
$output = [];
if(!empty($_SESSION['compare'][$ctx])){
    $lists = [];
    $products = [];

    $nav = '';
    $rows = '';
    $content = '';
    $data = '';
    foreach($_SESSION['compare'][$ctx] as $key => $list){
        if(empty($list)) continue;
        $lists[] = $key;
        foreach ($list as $id => $v){
            if($product = $modx->getObject('msProduct', $id)){
                $resource_data = $product->toArray();
                if($lang_key){
                    if ($polylangContent = $modx->getObject('PolylangContent', ['content_id' => $id, 'culture_key' => $lang_key])) {
                        $resource_data = array_merge($resource_data, $polylangContent->toArray());
                    }
                    if ($polylangOptions = $modx->getIterator('PolylangProductOption', ['content_id' => $id, 'culture_key' => $lang_key])) {
                        foreach($polylangOptions as $op){
                            $resource_data[$op->get('key')][0] = $op->get('value');
                        }
                    }
                }

                $products[$key][] = $resource_data;
            }
        }
    }

    $idx = 0;
    foreach($lists as $list){
        if($tplNav){
            $nav .= $pdo->parseChunk($tplNav, ['list' => $list, 'idx' => $idx]);
        }
        if(is_string($fields)){
            $fields = json_decode($fields,1);
        }
        if(empty($fields)){
            $fields = $pdo->runSnippet('@FILE snippets/snippet.getcomparefields.php', ['categoryName' => $list, 'exclude' => ['offerType'], 'addActions' => isset($scriptProperties['tplActions'])]);
        }
        if(empty($fields)) continue;
        foreach($fields as $field){
            $tpl = 'tpl'.ucfirst($field['key']);
            $data = '';
            foreach($products[$list] as $product){
                if(isset($scriptProperties[$tpl])){
                    $data .= $pdo->parseChunk($scriptProperties[$tpl], ['field' => $field, 'product' => $product]);
                }else if($scriptProperties['tplDefault']){
                    $data .= $pdo->parseChunk($scriptProperties['tplDefault'], ['field' => $field, 'product' => $product]);
                }else{
                    $output[$list][$field['key']][] = ['field' => $field, 'product' => $product];
                }

            }

            if($tplRow){
                $rows .= $pdo->parseChunk($tplRow, ['field' => $field, 'data' => $data]);
            }
        }
        $modx->log(1, print_r($rows,1));
        if($tplContent){
            $content .= $pdo->parseChunk($tplContent, ['list' => $list, 'rows' => $rows, 'idx' => $idx]);
        }
    }

    if($tplWrapper && $nav && $content){
        return $pdo->parseChunk($tplWrapper, ['nav' => $nav, 'idx' => $nav, 'content' => $content]);
    }


}
return $output;
