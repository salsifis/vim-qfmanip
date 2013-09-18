" Vim quickfix manipulation plugin.
" Plugin author: Benoit Mortgat
" Main git repository: http://github.com/salsifis/vim-qfmanip

" Do not edit these mappings
" Instead, redefine them into your .vimrc

" mapping prefixes
let g:qfmanip_hotkey_ql_prefix     = '_q'
let g:qfmanip_hotkey_ll_prefix     = '_l'

" filtering mapping suffixes
let g:qfmanip_hotkey_incl_filename = 'f'
let g:qfmanip_hotkey_excl_filename = 'F'
let g:qfmanip_hotkey_incl_pattern  = 'p'
let g:qfmanip_hotkey_excl_pattern  = 'P'

" sorting and uniq'ing mapping suffixes
let g:qfmanip_hotkey_sort          = 's'
let g:qfmanip_hotkey_uniq          = 'u'
let g:qfmanip_hotkey_sort_and_uniq = 'U'
"
" vim: ts=2 sw=2 et tw=80 colorcolumn=+1
