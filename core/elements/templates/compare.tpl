<<!doctype html>
<html lang="en">
{set $pagetitle = $_modx->resource.pagetitle}
{set $longtitle = $_modx->resource.longtitle}
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Compare</title>
</head>
<body>
<div class="comparison-wrapper">
    {set $compareLists = '!getCompareLists' | snippet:[]}
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                <main id="primary" class="site-main">
                    <div class="comparison w-100">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="section-title">
                                    <h2>{$longtitle?:$pagetitle}</h2>
                                </div>

                                {if $compareLists}
                                    <div class="row" id="tabs">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="product-info mt-half">
                                                <ul class="nav nav-pills justify-content-center" id="pills-tab" role="tablist">
                                                    {foreach $compareLists['lists'] as $list index=$i}
                                                        {set $lexiconKey = 'ms2_compare_'~$list}
                                                        <li class="nav-item">
                                                            <a class="nav-link {if $i === 0}active{/if}" data-bs-toggle="pill" href="#tab_{$list}">{$lexiconKey | lexicon}</a>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                                <div class="tab-content">
                                                    {foreach $compareLists['lists'] as $list index=$i}
                                                        <div class="tab-pane fade show {if $i === 0}active{/if}" id="tab_{$list}">
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered">
                                                                    <tbody>
                                                                    {set $fields = '!getCompareFields' | snippet:['categoryName' => $list]}
                                                                    {foreach $fields as $field}
                                                                        <tr>
                                                                            <td class="product-title">{$field.caption}</td>
                                                                            {foreach $compareLists['products'][$list] as $product}
                                                                                {switch $field.key}
                                                                                    {case 'pagetitle'}
                                                                                        <td>
                                                                                            <a href="{$product.uri}"><strong>{$product.longtitle?:$product.pagetitle}</strong></a>
                                                                                        </td>
                                                                                    {case 'thumb'}
                                                                                        <td>
                                                                                            <img src="{$product.thumb}" alt="{$product.longtitle?:$product.pagetitle}"
                                                                                                 class="img-thumbnail">
                                                                                        </td>
                                                                                    {case 'price'}
                                                                                        <td>
                                                                                            {if $old_price}
                                                                                                <del>{$old_price} {'ms2_frontend_currency' | lexicon}</del>
                                                                                            {/if}
                                                                                            <span>{$price} {'ms2_frontend_currency' | lexicon}</span>
                                                                                        </td>
                                                                                    {default}
                                                                                        <td>{$product[$field.key][0]?:'-'}</td>
                                                                                {/switch}
                                                                            {/foreach}
                                                                        </tr>
                                                                    {/foreach}
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end of row -->
                                {else}
                                    <div class="alert alert-warning" role="alert">
                                        {'ms2_compare_empty' | lexicon}
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div> <!-- end of comparison -->
                </main> <!-- end of #primary -->
            </div>
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div>
</body>
</html>