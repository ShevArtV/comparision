<li class="nav-item">
    {set $lexiconKey = 'ms2_option_value_'~$list}
    <a class="nav-link {if $idx === 0}active{/if}" data-bs-toggle="pill" href="#tab_{$list}">{$lexiconKey | lexicon}</a>
</li>