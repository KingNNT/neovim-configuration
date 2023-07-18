local Plug = vim.fn['plug#']
local environment = require("configs.default").env

local bundle_folder = environment.path .. '/bundle'
vim.call('plug#begin', bundle_folder)

Plug 'nvim-lua/plenary.nvim'                                          -- support module for neovim
Plug 'tpope/vim-sensible'                                             -- a universal set of defaults

Plug 'oxfist/night-owl.nvim'                                          -- theme
Plug 'folke/tokyonight.nvim'                                          -- theme
Plug 'nvim-tree/nvim-web-devicons'                                    -- lua `fork` of vim-devicons for neovim

Plug 'neovim/nvim-lspconfig'                                          -- neovim lsp config
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })                 -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

Plug 'hrsh7th/cmp-nvim-lsp'                                           -- A completion plugin for neovim
Plug 'hrsh7th/cmp-buffer'                                             -- A completion plugin for neovim
Plug 'hrsh7th/cmp-path'                                               -- A completion plugin for neovim
Plug 'hrsh7th/cmp-cmdline'                                            -- A completion plugin for neovim
Plug 'hrsh7th/nvim-cmp'                                               -- A completion plugin for neovim

Plug 'nvim-lualine/lualine.nvim'                                      -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

Plug('nvim-tree/nvim-tree.lua')                                       -- a file explorer tree for neovim written in lua

Plug 'preservim/tagbar'                                               -- Tagbar

Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.2' })          -- find, Filter, Preview, Pick. All lua, all the time.
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- plugin fzf for telescope

Plug('akinsho/toggleterm.nvim', { ['tag'] = '*' })                    -- terminal

Plug 'windwp/nvim-autopairs'                                          -- autoclosing braces and html tags

Plug 'mattn/emmet-vim'                                                -- support for expanding abbreviations similar to emmet

Plug 'numToStr/Comment.nvim'                                          -- smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
Plug 'nvim-ts-context-commentstring'                                  -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

Plug 'editorconfig/editorconfig-vim'                                  -- editorConfig plugin for Vim

Plug 'tpope/vim-surround'                                             -- delete/change/add parentheses/quotes/XML-tags/much more with ease

Plug 'vim-test/vim-test'                                              -- run your tests at the speed of thought

Plug 'lukas-reineke/indent-blankline.nvim'                            -- Indentlines
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })     -- Syntax highlighting

Plug 'jparise/vim-graphql'                                            -- a Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.

Plug 'puremourning/vimspector'                                        -- a multi-language debugging system for Vim

Plug('tpope/vim-fugitive')                                            -- A Git wrapper so awesome, it should be illegal
Plug('lewis6991/gitsigns.nvim')                                       -- Git integration for buffers

Plug 'wakatime/vim-wakatime'                                          -- vim plugin for automatic time tracking and metrics generated from your programming activity.

Plug 'tpope/vim-dadbod'                                               -- modern database interface for Vim
Plug 'kristijanhusak/vim-dadbod-ui'                                   -- simple UI for vim dadbod

Plug('nvimdev/dashboard-nvim', { ['event'] = 'VimEnter' })            -- vim dashboard


vim.call('plug#end')
