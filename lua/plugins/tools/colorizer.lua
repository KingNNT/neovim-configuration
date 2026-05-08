return {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPre" },
    config = function()
        require("colorizer").setup {
            filetypes = { "*" },
            buftypes = {},
            user_commands = true,
            lazy_load = false,
            options = {
                parsers = {
                    css = false,
                    css_fn = false,
                    names = {
                        enable = false,
                        lowercase = true,
                        camelcase = true,
                        uppercase = false,
                        strip_digits = false,
                        custom = false,
                    },
                    hex = {
                        default = false,
                        rgb = false,
                        rgba = false,
                        rrggbb = false,
                        rrggbbaa = false,
                        aarrggbb = false,
                    },
                    rgb = { enable = false },
                    hsl = { enable = false },
                    oklch = { enable = false },
                    tailwind = {
                        enable = true,
                        lsp = true,
                        update_names = true,
                    },
                    sass = {
                        enable = false,
                        parsers = { css = true },
                        variable_pattern = "^%$([%w_-]+)",
                    },
                    xterm = { enable = false },
                    custom = {},
                },
                display = {
                    mode = "background",
                    background = {
                        bright_fg = "#000000",
                        dark_fg = "#ffffff",
                    },
                    virtualtext = {
                        char = "■",
                        position = "eol",
                        hl_mode = "foreground",
                    },
                    priority = {
                        default = 150,
                        lsp = 200,
                    },
                },
                hooks = {
                    should_highlight_line = false,
                },
                always_update = false,
            },
        }
    end,
}
