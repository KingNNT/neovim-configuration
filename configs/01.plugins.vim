" Install Plugin

call plug#begin('~/.config/nvim/bundle')
" Setting
	Plug 'tpope/vim-sensible'						" A universal set of defaults

" Theme
	Plug 'haishanh/night-owl.vim'

" File browser
	Plug 'preservim/nerdTree'                     	" File browser  
	Plug 'Xuyuanp/nerdtree-git-plugin'            	" Git status
	Plug 'ryanoasis/vim-devicons'                 	" Icon
	Plug 'tiagofumo'
			\ .'/vim-nerdtree-syntax-highlight'
	Plug 'unkiwii/vim-nerdtree-sync'              	" Sync current file 

" File search
	Plug 'junegunn/fzf', 
		\ { 'do': { -> fzf#install() } }         	" Fuzzy finder 
	Plug 'junegunn/fzf.vim'


" Status bar
  	Plug 'vim-airline/vim-airline'
  	Plug 'vim-airline/vim-airline-themes'

" Terminal
  	Plug 'voldikss/vim-floaterm'                  	" Float terminal

" Code intellisense
	Plug 'neoclide/coc.nvim', 
		\ {'branch': 'release'}                     " Language server protocol (LSP) 
	Plug 'pappasam/coc-jedi',                     	" Jedi language server 
	Plug 'jiangmiao/auto-pairs'                   	" Parenthesis auto 
	Plug 'alvan/vim-closetag'
	Plug 'mattn/emmet-vim' 
	Plug 'preservim/nerdcommenter'                	" Comment code 
	Plug 'liuchengxu/vista.vim'                   	" Function tag bar 
	Plug 'alvan/vim-closetag'                     	" Auto close HTML/XML tag 
		\ { 
		\ 'do': 'yarn install '
				\ .'--frozen-lockfile '
				\ .'&& yarn build',
		\ 'branch': 'main' 
		\ }
	Plug 'editorconfig/editorconfig-vim'
	Plug 'tpope/vim-surround'
	Plug 'phpactor/phpactor'
 	Plug 'shawncplus/phpcomplete.vim'

" Code syntax highlight
	Plug 'sheerun/vim-polyglot'						" All language packs
  	"Plug 'yuezk/vim-js'                           	" Javascript
  	Plug 'MaxMEllon/vim-jsx-pretty'               	" JSX/React
  	"Plug 'jackguo380/vim-lsp-cxx-highlight'       	" C/C++
  	"Plug 'uiiaoo/java-syntax.vim'                 	" Java
	Plug 'leafgarland/typescript-vim'				" Typescript


" Debugging
  	Plug 'puremourning/vimspector'                	" Vimspector

" Source code version control 
  	Plug 'tpope/vim-fugitive'                     	" Git infomation 
  	Plug 'tpope/vim-rhubarb' 
  	Plug 'airblade/vim-gitgutter'                 	" Git show changes 
  	Plug 'samoshkin/vim-mergetool'                	" Git merge

" Calculator coding	
	Plug 'wakatime/vim-wakatime'
	


call plug#end()
