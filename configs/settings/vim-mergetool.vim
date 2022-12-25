" possible values: 'local' (default), 'remote', 'base'
let g:mergetool_prefer_revision = 'unmodified'

" (b) - for 'base' 
" (m) - for working tree version of MERGED file
" (r) - for 'remote' revision
" (L) - 'local'
" (R) = 'Remote'
let g:mergetool_layout = 'LR,b'

nmap <leader>mt <plug>(MergetoolToggle)
nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'


function! AirlineDiffmergePart()
  if get(g:, 'mergetool_in_merge_mode', 0)
    return '↸'
  endif

  if &diff
    return '↹'
  endif

  return ''
endfunction

call airline#parts#define_function('_diffmerge', 'AirlineDiffmergePart')
call airline#parts#define_accent('_diffmerge', 'bold')

let g:airline_section_z = airline#section#create(['_diffmerge'])
