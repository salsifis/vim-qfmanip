let s:prefixes =
 \ [ {'p' : g:qfmanip_hotkey_ql_prefix, 'what' : 'q'},
 \   {'p' : g:qfmanip_hotkey_ll_prefix, 'what' : 'l'}
 \ ]

let s:filter_configurations =
 \ [
 \    { 'map'    : g:qfmanip_hotkey_incl_filename,
 \      'action' : '+',
 \      'filter' : 'bufname(item.bufnr)',
 \      'prompt' : 'Only retain entries for which buffer name matches:'
 \    },
 \    { 'map'    : g:qfmanip_hotkey_incl_pattern,
 \      'action' : '+',
 \      'filter' : 'item.pattern . item.text',
 \      'prompt' : 'Only retain entries for which line text matches:'
 \    },
 \    { 'map'    : g:qfmanip_hotkey_excl_filename,
 \      'action' : '-',
 \      'filter' : 'bufname(item.bufnr)',
 \      'prompt' : 'Discard all entries for which buffer name matches:'
 \    },
 \    { 'map'    : g:qfmanip_hotkey_excl_pattern,
 \      'action' : '-',
 \      'filter' : 'item.pattern . item.text',
 \      'prompt' : 'Discard all entries for which line text matches:'
 \    }
 \ ]

for s:prefix in s:prefixes
    for s:action in s:filter_configurations
        execute 'nnoremap ' . s:prefix['p'] . s:action['map'] . ' '
        \     . ':call qfmanip#filter("' . s:prefix['what']       . '"'
        \     .                     ',"' . s:action['filter']     . '"'
        \     .                     ',"' . s:action['action']     . '"'
        \     .                     ',input("'.s:action['prompt'] . ' ", "")'
        \     .                     ')<CR>'
    endfor
endfor

for s:prefix in s:prefixes
    execute 'nnoremap ' . s:prefix['p'] . g:qfmanip_hotkey_sort . ' '
    \     . ':call qfmanip#sort("' . s:prefix['what'] . '")<CR>'

    execute 'nnoremap ' . s:prefix['p'] . g:qfmanip_hotkey_uniq . ' '
    \     . ':call qfmanip#uniq("' . s:prefix['what'] . '")<CR>'

    execute 'nnoremap ' . s:prefix['p'] . g:qfmanip_hotkey_sort_and_uniq . ' '
    \     . ':call qfmanip#sort("' . s:prefix['what'] . '")<CR>'
    \     . ':call qfmanip#uniq("' . s:prefix['what'] . '")<CR>'
endfor

