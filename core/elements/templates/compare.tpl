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
<div class="comparison-wrapper" id="{$id}">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                <main id="primary" class="site-main">
                    <div class="comparison w-100">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="section-title">
                                    <h2>{$resource.longtitle?:$resource.pagetitle}</h2>
                                </div>
                                <div>{set $compareLists = '!getCompareLists' | snippet: [
                                    'tplWrapper' => '@FILE yourfit/chunks/getcomparelists/wrapper.tpl',
                                    'tplNav' => '@FILE yourfit/chunks/getcomparelists/nav_item.tpl',
                                    'tplContent' => '@FILE yourfit/chunks/getcomparelists/content_item.tpl',
                                    'tplRow' => '@FILE yourfit/chunks/getcomparelists/row.tpl',
                                    'tplPagetitle' => '@FILE yourfit/chunks/getcomparelists/tplPagetitle.tpl',
                                    'tplThumb' => '@FILE yourfit/chunks/getcomparelists/tplThumb.tpl',
                                    'tplPrice' => '@FILE yourfit/chunks/getcomparelists/tplPrice.tpl',
                                    'tplActions' => '@FILE yourfit/chunks/getcomparelists/tplActions.tpl',
                                    'tplDefault' => '@FILE yourfit/chunks/getcomparelists/tplDefault.tpl'
                                    ]}
                                </div>


                                {if $compareLists}
                                {$compareLists}
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