" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

""""" enable the theme

syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }