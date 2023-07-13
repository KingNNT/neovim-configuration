require('dashboard').setup {
    hide = {
        statusline = false,
        winbar = false,
    },
    theme = 'hyper',
    config = {
        packages = { enable = false },
        project = { enable = false },
        mru = { enable = false },
        header = {
            [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
            [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
            [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
            [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
            [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
            [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
            [[ ]],
            [[ ]],
        },
        center = {
            {},
        },
        footer =
        {
            [[ ]],
            [[ ]],
            [[ ]],
            [[ ]],
            [[ ]],
            [[ Develop by KingNNT]],
        }
        ,
        shortcut = {
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
        },
    },
}
