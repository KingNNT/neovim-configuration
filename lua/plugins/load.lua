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
        -- lua `fork` of vim-web-devicons for neovim
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        priority = 980,
    },
    {
        "folke/snacks.nvim",
        priority = 970,
        lazy = false,
        opts = function()
            return require('plugins.configs.optionals.snacks').opts
        end,
        keys = function()
            return require('plugins.configs.optionals.snacks').keys
        end,
        init = function()
            return require('plugins.configs.optionals.snacks').init
        end,
    },
    {
        -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
        "folke/tokyonight.nvim",
        lazy = true,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
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
        "mfussenegger/nvim-dap",
        lazy = true
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        lazy = true
    },
    {
        "mfussenegger/nvim-lint",
        lazy = true
    },
    -- {
    --     "mhartington/formatter.nvim"
    -- },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = 'rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = '*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        opts = function()
            return require('plugins.configs.optionals.blink').opts
        end,
        opts_extend = function()
            return require('plugins.configs.optionals.blink').opts_extend
        end,
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
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = true
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
        lazy = true
    },
    {
        -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
        'numToStr/Comment.nvim',
        lazy = true,
    },
    {
        -- Highlight, list and search todo comments in your projects
        'folke/todo-comments.nvim',
        lazy = true
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
            "nvim-neotest/neotest-python"
        },
        lazy = true
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
        lazy = true
    },
    {
        -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = true,
    },
    {
        -- Git integration for buffers
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = {
            'tpope/vim-fugitive'
        }
    },
    {
        -- Vim plugin for automatic time tracking and metrics generated from your programming activity.
        -- Don't set lazy for this plugin
        'wakatime/vim-wakatime',
    },
    {
        -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = function()
            return require('plugins.configs.optionals.which-key').opts
        end,
        init = function()
            return require('plugins.configs.optionals.which-key').init
        end,
        lazy = true,
    },
    {
        -- Color for hex code
        "NvChad/nvim-colorizer.lua",
        lazy = true
    },
    {
        -- Lightweight yet powerful formatter plugin for Neovim
        "stevearc/conform.nvim",
        lazy = true
    }
}

return plugins
