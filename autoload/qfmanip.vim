" Vim quickfix manipulation plugin.
" Plugin author: Benoit Mortgat
" Main git repository: http://github.com/salsifis/vim-qfmanip

" {{{ private helper functions:
" {{{ quickfix list and location list setters and getters
function! <SID>GetList(type)
  if a:type ==# 'l'
    return getloclist(0)
  else
    return getqflist()
  endif
endfunction

function! <SID>SetList(type, list, opts)
  if a:type ==# 'l'
    return setloclist(0, a:list, a:opts)
  else
    return setqflist(a:list, a:opts)
  endif
endfunction
" }}}
" {{{ list comparison functor
function! <SID>listcmp(i1, i2)
  if bufname(a:i1.bufnr) == bufname(a:i2.bufnr)
    return a:i1.lnum == a:i2.lnum ? 0 : (a:i1.lnum < a:i2.lnum ? -1 : 1)
  else
    return bufname(a:i1.bufnr) < bufname(a:i2.bufnr) ? -1 : 1
  endif
endfunction
" }}}
" }}}

" {{{ public functions
function qfmanip#filter(type, qfitempattern, action, pattern)
  let search_pattern = a:pattern
  if search_pattern =~ '^$'
    let search_pattern = @/
  endif
  let s:current_list = <SID>GetList(a:type)
  let s:new_list = []
  for item in s:current_list
    if item.valid
      exec 'let s:compare_pattern = ' . a:qfitempattern
      let s:matches = s:compare_pattern =~ search_pattern
      if (s:matches == (a:action ==# '+'))
        let s:new_list += [item]
      endif
    endif
  endfor
  call <SID>SetList(a:type, s:new_list, '')
endfunction

function qfmanip#sort(type)
  call <SID>SetList(a:type, sort(<SID>GetList(a:type), '<SID>listcmp'), 'r')
endfunction

function qfmanip#uniq(type)
  let origList = <SID>GetList(a:type)
  let uniqedList = []
  let lastitem = ''
  for item in origList
    let thisitem = bufname(item.bufnr) . "\t" . item.lnum
    if thisitem !=# lastitem
      call add(uniqedList, item)
      let lastitem = thisitem
    endif
  endfor
  call <SID>SetList(a:type, uniqedList, 'r')
endfunction
" }}}

" vim: ts=2 sw=2 et tw=80 colorcolumn=+1 foldmethod=marker
