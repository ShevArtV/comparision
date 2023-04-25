<?php
$fields = [
    [
        'key' => 'pagetitle',
        'caption' => 'Название'
    ],
    [
        'key' => 'thumb',
        'caption' => 'Превью'
    ],
    [
        'key' => 'price',
        'caption' => 'Цена'
    ],

];
if(!$categoryName){
    return $fields;
}

if(!$category = $modx->getObject('modResource', ['pagetitle' => ucfirst($categoryName), 'context_key' => $modx->context->key])){
    return $fields;
}

$tablePrefix = $modx->getOption('table_prefix');
$sql = "SELECT `{$tablePrefix}ms2_options`.`key`, {$tablePrefix}ms2_options`.`caption` FROM `{$tablePrefix}ms2_options` 
LEFT JOIN `{$tablePrefix}ms2_category_options` ON `{$tablePrefix}ms2_options`.`id` = `{$tablePrefix}ms2_category_options`.`option_id`
WHERE  `{$tablePrefix}ms2_category_options`.`category_id` = {$category->get('id')}";
$stmt = $modx->prepare($sql);
if($stmt->execute()){
    $fields = array_merge($fields,$stmt->fetchAll(PDO::FETCH_ASSOC));

    return array_filter($fields, function($el){
        return !(in_array($el['key'], ['offerType']));
    });
}
return $fields;
