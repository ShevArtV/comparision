<tr>
    {set $lexiconCaptionKey = 'ms2_option_caption_'~($field.key | lower)}
    <td class="product-title">{$lexiconCaptionKey | lexicon}</td>
    {$data}
</tr>