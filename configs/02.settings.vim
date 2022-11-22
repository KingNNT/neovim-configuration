"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                 " Enable mouse
set tabstop=2               " 
set softtabstop=0           "
set shiftwidth=2            " 
set expandtab
set autoindent
set listchars=tab:\¦\       " Tab character
set list
set foldmethod=syntax       " 
set foldnestmax=1
set foldlevelstart=0        "  
set number                  " Show line number
set ignorecase              " Enable case-sensitive 
set cursorline
set encoding=UTF-8


" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
set synmaxcol=200
set lazyredraw
set mmp=5000
set ttimeoutlen=50
set incsearch 
set hlsearch
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype
autocmd BufEnter * :set scroll=10
syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None

" Filetype
let mapleader = "\<Space>"
filetype plugin on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Move line
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>
