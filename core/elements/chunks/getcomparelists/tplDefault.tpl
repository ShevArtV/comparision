<td>
    {if $field.key in list ['offerType','lining','season','upper','insole','sole','gender','age']}
        {set $lexiconKey = 'ms2_option_value_'~($product[$field.key][0] | lower)}
        {$product[$field.key][0] ? ($lexiconKey | lexicon) : '-'}
    {elseif $field.key in list ['preOrderAvailable','specialOffer','customizationAvailable']}
        {$product[$field.key][0] ? ('ms2_option_value_yes' | lexicon) : ('ms2_option_value_no' | lexicon)}
    {elseif $field.key === 'color_op'}
        {set $colorProps = $product['color_op.properties'] | fromJSON}
        {set $color = ''}
        {foreach $colorProps['values'] as $item}
            {if $item.name === $product[$field.key][0]}
                {set $color = $item.value}
            {/if}
        {/foreach}
        {if $color}
            <div class="d-flex align-items-center justify-content-center">
                <div style="width:30px;height:30px;background: {$color};"></div>
            </div>
        {/if}
    {else}
        {$product[$field.key][0]?:'-'}
    {/if}
</td>