<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product card</title>
</head>
<body>
{set $rid = $_modx->resource.id}
{set $parentName = $_modx->resource.parent | resource: 'pagetitle'}
{'!AjaxFormitLogin' | snippet:[
'snippet' => 'Comparision',
'id' => $rid,
'list' => $parentName,
'form' => '@FILE yourfit/chunks/forms/compare_single.tpl',
'validate' => '',
'fid' => 'compare_single',
'formName' => 'Форма сравнения в карточке товара',
]}
</body>

</html>