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
    },
    -- UI Enhancements
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
        -- Navigate your code with search labels, enhanced character motions and Treesitter integration
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = function()
            return require('plugins.configs.optionals.flash').opts
        end,
        keys = function()
            return require('plugins.configs.optionals.flash').keys
        end,
    },
    -- LSP & Autocompletion
    {
        -- Quickstart configs for Nvim LSP
        "neovim/nvim-lspconfig",
        lazy = true,
    },
    {
        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
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
        "mfussenegger/nvim-lint",
        lazy = true
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
        -- Lightweight yet powerful formatter plugin for Neovim
        "stevearc/conform.nvim",
        lazy = true
    },
    -- Debugging & Testing
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
    -- Productivity Tools
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
    -- Git Integration
    {
        -- Git integration for buffers
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = {
            'tpope/vim-fugitive'
        }
    },
    -- Miscellaneous
    {
        -- Color for hex code
        "NvChad/nvim-colorizer.lua",
        lazy = true
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
            return require('plugins.configs.optionals.3_which-key').opts
        end,
        init = function()
            return require('plugins.configs.optionals.3_which-key').init
        end,
        lazy = true,
    },
    {
        -- autopairs for neovim written by lua
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        lazy = true
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = function()
            return require('plugins.configs.optionals.avante').opts
        end,
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick",         -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            "stevearc/dressing.nvim",        -- for input provider dressing
            "folke/snacks.nvim",             -- for input provider snacks
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua",        -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
}

return plugins
