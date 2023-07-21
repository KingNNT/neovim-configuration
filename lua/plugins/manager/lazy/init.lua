local plugins = {
    {
        "nvim-lua/plenary.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "tpope/vim-sensible",
        lazy = false,
        priority = 990
    },
    {
        "oxfist/night-owl.nvim",
        lazy = false,
        priority = 980,
        config = function()
            vim.cmd.colorscheme("night-owl")
        end,
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 980,
    --     config = function()
    --         vim.cmd.colorscheme("tokyonight")
    --     end,
    -- },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        priority = 970,
        opts = {
            -- your personnal icons can go here (to override)
            -- you can specify color or cterm_color instead of specifying both of them
            -- DevIcon will be appended to `name`
            override = {
                zsh = {
                    icon = "",
                    color = "#428850",
                    cterm_color = "65",
                    name = "Zsh"
                }
            },
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = true,
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true,
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true,
            -- same as `override` but specifically for overrides by filename
            -- takes effect when `strict` is true
            override_by_filename = {
                [".gitignore"] = {
                    icon = "",
                    color = "#f1502f",
                    name = "Gitignore"
                }
            },
            -- same as `override` but specifically for overrides by extension
            -- takes effect when `strict` is true
            override_by_extension = {
                ["log"] = {
                    icon = "",
                    color = "#81e043",
                    name = "Log"
                }
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
    },
    {
        "neoclide/coc.nvim",
        branch = 'release',
        lazy = false,
    },
    {
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
        "nvim-lualine/lualine.nvim",
        lazy = true,
    },
    {
        "editorconfig/editorconfig-vim",
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
    },
    {
        "preservim/tagbar",
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        lazy = true,
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        lazy = true,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    {
        'mattn/emmet-vim',
    },
    {
        'numToStr/Comment.nvim',
        lazy = true,
    },
    {
        'vim-test/vim-test',
        lazy = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        lazy = true,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-tree-docs'
        },
        lazy = true,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        'puremourning/vimspector',
        lazy = true,
    },
    {
        'tpope/vim-fugitive',
        lazy = true,
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = { { 'tpope/vim-fugitive' } }
    },
    {
        'wakatime/vim-wakatime',
    },
    {
        'tpope/vim-dadbod',
        lazy = true,
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = { { 'tpope/vim-dadbod' } },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        lazy = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}

local config = require 'plugins.manager.lazy.configs.lazy'

require("lazy").setup(plugins, config)
