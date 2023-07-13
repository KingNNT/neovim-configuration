local Plug = vim.fn['plug#']
local environment = require("configs.default").env

local bundle_folder = environment.path .. '/bundle'
vim.call('plug#begin', bundle_folder)

Plug 'tpope/vim-sensible'    -- a universal set of defaults
Plug 'nvim-lua/plenary.nvim' -- support module for neovim

-- Plug 'haishanh/night-owl.vim' -- theme
Plug 'oxfist/night-owl.nvim' -- theme


Plug 'neovim/nvim-lspconfig'                                          -- neovim lsp config
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })                 -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

Plug 'nvim-tree/nvim-web-devicons'                                    -- lua `fork` of vim-devicons for neovim

Plug 'nvim-lualine/lualine.nvim'                                      -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

Plug('nvim-tree/nvim-tree.lua')                                       -- a file explorer tree for neovim written in lua

Plug 'preservim/tagbar'                                               -- Tagbar

Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.2' })          -- find, Filter, Preview, Pick. All lua, all the time.
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- plugin fzf for telescope

Plug('akinsho/toggleterm.nvim', { ['tag'] = '*' })                    -- terminal


Plug 'jiangmiao/auto-pairs'                                       -- insert or delete brackets, parens, quotes in pair.
Plug 'alvan/vim-closetag'                                         -- auto close (X)HTML tags
Plug 'windwp/nvim-autopairs'                                      -- autoclosing braces and html tags

Plug 'mattn/emmet-vim'                                            -- support for expanding abbreviations similar to emmet

Plug 'preservim/nerdcommenter'                                    -- intensely nerdy commenting powers

Plug 'editorconfig/editorconfig-vim'                              -- editorConfig plugin for Vim

Plug 'tpope/vim-surround'                                         -- delete/change/add parentheses/quotes/XML-tags/much more with ease

Plug 'shawncplus/phpcomplete.vim'                                 -- improved PHP omnicompletion

Plug 'vim-test/vim-test'                                          -- run your tests at the speed of thought

Plug 'sheerun/vim-polyglot'                                       -- a solid language pack for Vim.

Plug 'posva/vim-vue'                                              -- syntax Highlight for Vue.js components
Plug 'MaxMEllon/vim-jsx-pretty'                                   -- [Vim script] JSX and TSX syntax pretty highlighting for vim.
Plug 'peitalin/vim-jsx-typescript'                                -- react JSX syntax highlighting for vim and Typescript
Plug 'leafgarland/typescript-vim'                                 -- typescript syntax files for Vim
Plug 'folke/todo-comments.nvim'                                   -- highlight, list and search todo comments in your projects
Plug 'ap/vim-css-color'                                           -- highlight color css
Plug 'leafOfTree/vim-matchtag'                                    -- highlight matching tags in any files such as html, xml, js, jsx, vue, svelte.
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- Syntax highlighting
Plug 'lukas-reineke/indent-blankline.nvim'                        -- Indentlines

Plug 'jparise/vim-graphql'                                        -- a Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.

Plug 'puremourning/vimspector'                                    -- a multi-language debugging system for Vim

Plug('lewis6991/gitsigns.nvim')                                   -- Git integration for buffers

Plug 'wakatime/vim-wakatime'                                      -- vim plugin for automatic time tracking and metrics generated from your programming activity.

Plug 'tpope/vim-dadbod'                                           -- modern database interface for Vim
Plug 'kristijanhusak/vim-dadbod-ui'                               -- simple UI for vim dadbod

Plug('nvimdev/dashboard-nvim', { ['event'] = 'VimEnter' })        -- vim dashboard


vim.call('plug#end')


local core_conf_files = {
    "coc.lua",
    "dashboard-nvim.lua",
    "emmet-vim.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "nerdcommenter.vim",
    "night-owl.lua",
    "nvim-tree.lua",
    "tagbar.vim",
    "telescope.lua",
    "todo-comments.vim",
    "toggleterm.lua",
    "vim-dadbod-ui.vim",
    "vim-test.vim",
    "vimspector.vim",
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
