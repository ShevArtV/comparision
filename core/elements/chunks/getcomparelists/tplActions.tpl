<td>
    <div class="d-flex justify-content-center align-items-center">
        {set $offerType = ($product.offerType[0] | lower)}
        {set $id = ($product.id)}
        <a href="{$product.uri}" class="btn btn-secondary mb-2 mb-xl-0 me-xl-2">{'ms2_frontend_add_to_cart' | lexicon}</a>
        {'!AjaxFormitLogin' | snippet: [
            'form' => '@FILE yourfit/chunks/forms/compare.tpl',
            'snippet' => 'Comparision',
            'id' => $id,
            'list' => $offerType,
            'redirectTo' => $_modx->resource.id,
            'redirectTimeout' => '3000',
        ]}
    </div>
</td>