local lazy = require("lazy")

local plugins = {
    -- START: Common --
    {
        -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
        "nvim-lua/plenary.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        -- sensible.vim: Defaults everyone can agree on
        "tpope/vim-sensible",
        lazy = false,
        priority = 990
    },
    {
        -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 980,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        -- lua `fork` of vim-web-devicons for neovim
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        priority = 970,
    },
    {
        -- Quickstart configs for Nvim LSP
        "neovim/nvim-lspconfig",
        lazy = true,
    },
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    {
        "williamboman/mason.nvim",
        lazy = true,
    },
    {
        -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim"
        },
        lazy = true,
    },
    {
        -- A completion plugin for neovim coded in Lua
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
    },
    {
        -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
        "folke/neodev.nvim",
        opts = {}
    },
    -- END: Common --
    {
        -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
        "nvim-lualine/lualine.nvim",
        lazy = true,
    },
    {
        -- A snazzy bufferline for Neovim
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        -- EditorConfig plugin for Vim
        "editorconfig/editorconfig-vim",
    },
    {
        -- Not UFO in the sky, but an ultra fold in Neovim.
        'kevinhwang91/nvim-ufo',
        lazy = true,
        dependencies = 'kevinhwang91/promise-async'
    },
    {
        -- A file explorer tree for neovim written in lua
        "nvim-tree/nvim-tree.lua",
        lazy = true,
    },
    {
        -- Neovim plugin for a code outline window
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        lazy = true
    },
    {
        -- Navigate your code with search labels, enhanced character motions and Treesitter integration
        "folke/flash.nvim",
        event = "VeryLazy",
    },
    {
        -- Find, Filter, Preview, Pick. All lua, all the time.
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        lazy = true,
    },
    {
        -- autopairs for neovim written by lua
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    {
        -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
        'numToStr/Comment.nvim',
        lazy = true,
    },
    {
        -- Highlight, list and search todo comments in your projects
        'folke/todo-comments.nvim'
    },
    {
        -- An extensible framework for interacting with tests within NeoVim.
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- Plugin adapter
            "haydenmeade/neotest-jest",
            "thenbe/neotest-playwright",
        }
    },
    {
        -- Indent guides for Neovim
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        opts = {},
        lazy = true,
    },
    {
        -- Rainbow delimiters for Neovim with Tree-sitter
        'HiPhish/rainbow-delimiters.nvim',
        lazy = true,
    },
    {
        -- Nvim Treesitter configurations and abstraction layer
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        lazy = true,
    },
    {
        -- A better annotation generator. Supports multiple languages and annotation conventions.
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = true,
    },
    {
        -- A Git wrapper so awesome, it should be illegal
        'tpope/vim-fugitive',
        lazy = true,
    },
    {
        -- Git integration for buffers
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = { { 'tpope/vim-fugitive' } }
    },
    {
        -- Vim plugin for automatic time tracking and metrics generated from your programming activity.
        -- Don't set lazy for this plugin
        'wakatime/vim-wakatime',
    },
    {
        -- vim dashboard
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        lazy = true,
    },
    {
        -- Create key bindings that stick.
        -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        lazy = true,
    },
    {
        -- The superior project management solution for neovim.
        "ahmedkhalf/project.nvim",
        lazy = true,
    },
    {
        -- Color for hex code
        "NvChad/nvim-colorizer.lua",
        lazy = true
    },
    {
        "mhartington/formatter.nvim",
        lazy = true,
    },
    {
        -- Lightweight yet powerful formatter plugin for Neovim
        "stevearc/conform.nvim",
        lazy = true
    }
}

local config = require 'plugins.configs.lazy'

lazy.setup(plugins, config)

local core_conf_files = {
    "neodev.lua",
    --
    "aerial.lua",
    "bufferline.lua",
    "Comment.lua",
    "conform.lua",
    "dashboard-nvim.lua",
    "flash.lua",
    "formatter.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "mason.lua",
    "neogen.lua",
    "neotest.lua",
    "nvim-autopairs.lua",
    "nvim-cmp.lua",
    "nvim-colorizer.lua",
    "nvim-tree.lua",
    "nvim-treesitter.lua",
    "nvim-ts-context-commentstring.lua",
    "nvim-ufo.lua",
    "nvim-web-devicons.lua",
    "rainbow-delimiters.lua",
    "telescope.lua",
    "todo-comments.lua",
    "tokyonight.lua",
    "which-key.lua"
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
