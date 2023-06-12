" Install Plugin

call plug#begin('~/.config/nvim/bundle')
" Setting
	Plug 'tpope/vim-sensible'						" A universal set of defaults
	Plug 'neovim/nvim-lspconfig'							" Neovim lsp config

" Theme
	Plug 'haishanh/night-owl.vim'

" File browser
	Plug 'preservim/nerdTree'                     	" File browser  
	Plug 'Xuyuanp/nerdtree-git-plugin'            	" Git status
	Plug 'ryanoasis/vim-devicons'                 	" Icon
	Plug 'johnstef99/vim-nerdtree-syntax-highlight'
	Plug 'unkiwii/vim-nerdtree-sync'              	" Sync current file
	Plug 'preservim/tagbar'							" Tag bar

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
 	Plug 'shawncplus/phpcomplete.vim'
	Plug 'vim-test/vim-test'

" Code syntax highlight
	Plug 'sheerun/vim-polyglot'						" All language packs
  	"Plug 'yuezk/vim-js'                           	" Javascript
	Plug 'posva/vim-vue'							" VueJS
  	Plug 'MaxMEllon/vim-jsx-pretty'               	" JSX/React
	Plug 'peitalin/vim-jsx-typescript'				" TSX
	Plug 'styled-components/vim-styled-components'	" Styled Components
	Plug 'jparise/vim-graphql'
  	"Plug 'jackguo380/vim-lsp-cxx-highlight'       	" C/C++
  	"Plug 'uiiaoo/java-syntax.vim'                 	" Java
	Plug 'leafgarland/typescript-vim'				" Typescript
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'folke/todo-comments.nvim'
	Plug 'ap/vim-css-color'							" Color CSS
	Plug 'leafOfTree/vim-matchtag'					" Match Tag

" Debugging
  	Plug 'puremourning/vimspector'                	" Vimspector

" Source code version control 
  	Plug 'tpope/vim-fugitive'                     	" Git infomation 
  	Plug 'tpope/vim-rhubarb' 						" Github extension for vim-fugitiv
  	Plug 'airblade/vim-gitgutter'                 	" Git show changes 
  	Plug 'samoshkin/vim-mergetool'                	" Git merge

" Support coding	
	Plug 'wakatime/vim-wakatime'
	Plug '907th/vim-auto-save'

call plug#end()
