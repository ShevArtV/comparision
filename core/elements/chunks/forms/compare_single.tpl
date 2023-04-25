<form class="d-inline-block">
    <input type="hidden" name="list" value="{$list}">
    <input type="hidden" name="id" value="{$id}">
    <input type="hidden" name="ctx" value="{$_modx->context.key}">
    {set $lexicon = $.session['compare'][$_modx->context.key][$list][$id] ? ('ajaxformitlogin_compare_btn_remove' | lexicon) : ('ajaxformitlogin_compare_btn_add' | lexicon)}
    <button class="btn-compare afl-compare-btn" type="submit">{$lexicon}</button>
</form>