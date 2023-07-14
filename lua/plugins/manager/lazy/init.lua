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
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 980,
        enable = false,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
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
        "nvim-lualine/lualine.nvim",
        lazy = true,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
    },
    {
        "preservim/tagbar",
        lazy = true,
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
        'jiangmiao/auto-pairs',
        lazy = true,
    },
    {
        'alvan/vim-closetag',
        lazy = true,
    },
    {
        'windwp/nvim-autopairs',
        lazy = true,
    },
    {
        'mattn/emmet-vim',
        lazy = true,
    },
    {
        'numToStr/Comment.nvim',
        lazy = true,
    },
    {
        'nvim-ts-context-commentstring',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        lazy = true,
    },
    {
        'shawncplus/phpcomplete.vim',
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
        'leafOfTree/vim-matchtag',
        lazy = true,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = true,
    },
    {
        'jparise/vim-graphql',
        lazy = true,
    },
    {
        'puremourning/vimspector',
        lazy = true,
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
    },
    {
        'wakatime/vim-wakatime',
        lazy = true,
    },
    {
        'tpope/vim-dadbod',
        lazy = true,
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        lazy = true,
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        lazy = true,
    }
}

local config = require 'plugins.manager.lazy.configs.lazy'

require("lazy").setup(plugins, config)
