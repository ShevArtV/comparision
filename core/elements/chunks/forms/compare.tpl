<form>
    <input type="hidden" name="list" value="{$list}">
    <input type="hidden" name="id" value="{$id}">
    <input type="hidden" name="ctx" value="{$_modx->context.key}">
    <button class="btn btn-danger afl-compare-btn" type="submit">{('ajaxformitlogin_compare_btn_remove' | lexicon)}</button>
</form>