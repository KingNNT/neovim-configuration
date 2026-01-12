local plugins = {
    -- Core dependencies
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
        config = function()
            require('plugins.configs.nvim-web-devicons')
        end,
    },
    -- UI Enhancements
    {
        "folke/snacks.nvim",
        priority = 970,
        lazy = false,
        opts = function()
            return require('plugins.configs.snacks').opts
        end,
        keys = function()
            return require('plugins.configs.snacks').keys
        end,
        init = function()
            return require('plugins.configs.snacks').init
        end,
    },
    {
        -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 960,
        config = function()
            require('plugins.configs.tokyonight')
        end,
    },
    {
        -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require('plugins.configs.lualine')
        end,
    },
    {
        -- A snazzy bufferline for Neovim
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function()
            require('plugins.configs.bufferline')
        end,
    },
    {
        -- Not UFO in the sky, but an ultra fold in Neovim.
        'kevinhwang91/nvim-ufo',
        event = "VeryLazy",
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            require('plugins.configs.nvim-ufo')
        end,
    },
    {
        -- Navigate your code with search labels, enhanced character motions and Treesitter integration
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = function()
            return require('plugins.configs.flash').opts
        end,
        keys = function()
            return require('plugins.configs.flash').keys
        end,
    },
    -- LSP & Autocompletion
    {
        -- Quickstart configs for Nvim LSP
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugins.configs.lspconfig')
        end,
    },
    {
        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require('plugins.configs.mason')
        end,
    },
    {
        -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim"
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugins.configs.mason-lspconfig')
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugins.configs.nvim-lint')
        end,
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
        event = "InsertEnter",
        config = function()
            require('plugins.configs.nvim-cmp')
        end,
    },
    {
        -- Lightweight yet powerful formatter plugin for Neovim
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "ConformInfo",
        config = function()
            require('plugins.configs.conform')
        end,
    },
    -- Debugging & Testing
    {
        "mfussenegger/nvim-dap",
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        keys = function()
            return require('plugins.configs.nvim-dap').keys
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        config = function()
            require('plugins.configs.nvim-dapui')
        end,
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
        cmd = "Neotest",
        config = function()
            require('plugins.configs.neotest')
        end,
    },
    -- Productivity Tools
    {
        -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugins.configs.Comment')
        end,
    },
    {
        -- Highlight, list and search todo comments in your projects
        'folke/todo-comments.nvim',
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TodoTrouble", "TodoTelescope" },
        config = function()
            require('plugins.configs.todo-comments')
        end,
    },
    {
        -- Rainbow delimiters for Neovim with Tree-sitter
        'HiPhish/rainbow-delimiters.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugins.configs.rainbow-delimiters')
        end,
    },
    {
        -- Nvim Treesitter configurations and abstraction layer
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSUpdate", "TSInstall" },
        config = function()
            require('plugins.configs.nvim-treesitter')
        end,
    },
    {
        -- A better annotation generator. Supports multiple languages and annotation conventions.
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "Neogen",
        config = function()
            require('plugins.configs.neogen')
        end,
    },
    {
        -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        config = function()
            require('plugins.configs.trouble')
        end,
    },
    {
        "3rd/image.nvim",
        ft = { "markdown", "python", "jupyter" },
        opts = require("plugins.configs.imagemagick").opts,
    },
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false, -- Must load early to intercept .ipynb files
        opts = require("plugins.configs.jupytext").opts,
    },
    {
        "benlubas/molten-nvim",
        build = ":UpdateRemotePlugins",
        ft = { "python", "jupyter" },
        dependencies = {
            "3rd/image.nvim",
            "GCBallesteros/jupytext.nvim",
        },
        init = require("plugins.configs.molten").init,
        keys = require("plugins.configs.molten").keys,
    },
    -- Git Integration
    {
        -- Git integration for buffers
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'tpope/vim-fugitive'
        },
        config = function()
            require('plugins.configs.gitsigns')
        end,
    },
    -- Miscellaneous
    {
        -- Color for hex code
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
        config = function()
            require('plugins.configs.nvim-colorizer')
        end,
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
            return require('plugins.configs.which-key').opts
        end,
        init = function()
            return require('plugins.configs.which-key').init
        end,
        lazy = true,
    },
    {
        -- autopairs for neovim written by lua
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('plugins.configs.nvim-autopairs')
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        config = function()
            require('plugins.configs.lazydev')
        end,
    },
}

return plugins
