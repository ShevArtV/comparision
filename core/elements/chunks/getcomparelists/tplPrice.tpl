<td>
    {set $price = '!msMultiCurrencyPrice' | snippet : ['price' => $product.price]}
    {set $old_price = '!msMultiCurrencyPrice' | snippet : ['price' => $product.old_price]}
    {if $old_price}
        <del>{$old_price} {$_modx->getPlaceholder('msmc.symbol_right')}</del>
    {/if}
    <span>{$price} {$_modx->getPlaceholder('msmc.symbol_right')}</span>
</td>