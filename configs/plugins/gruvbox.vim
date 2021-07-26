call plug#begin('~/.config/nvim/bundle')
Plug 'morhetz/gruvbox'
call plug#end()

syntax enable
set background=dark
highlight Normal ctermbg=None
colorscheme gruvbox
let g:airline_theme='gruvbox'
set termguicolors