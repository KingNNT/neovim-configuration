<h1 align="center">Neovim Configuration</h1>

<div align="center">
  <h6 align="center">Develop by KingNNT</h6>
</div> 

<div align="center" style="margin-bottom: 16px">
	<a href="https://github.com/KingNNT/neovim-configuration/wiki">
    Wiki
  </a>
</div> 

<div align="center">

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.9.1-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/KingNNT/KingNNT.svg?style=flat-square&label=Issues&color=d77982)](https://github.com/KingNNT/neovim-configuration)
</div>

## Showcase

![neovim-dashboard-image](./images/neovim_1.png?raw=true)

## What is it?

- It is just a simple neovim config


## Install
```
git clone https://github.com/KingNNT/neovim-configuration ~/.config/nvim --depth 1 && nvim

```

## Uninstall

- ***Linux / Macos (unix)***

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

```


## Plugins list
<table>
  <thead>
    <tr>
      <th colspan="1">Feature</th>
      <th colspan="2">Plugin</th>
      <th colspan="1">Note</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Support function neovim </td>
      <td>
        <a href="https://github.com/nvim-lua/plenary.nvim">plenary.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Default setting neovim</td>
      <td>
        <a href="https://github.com/tpope/vim-sensible">vim-sensible</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Theme</td>
      <td>
        <a href="https://github.com/folke/tokyonight.nvim">tokyonight.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Icon fonts</td>
      <td>
        <a href="https://github.com/nvim-tree/nvim-web-devicons"> nvim-web-devicons </a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>NeoVim LSP configuration (not build-in)</td>
      <td>
        <a href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">Language server</td>
      <td rowspan="1">
        <a href="https://github.com/williamboman/mason.nvim">mason.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    </tr>
      <tr>
      <td>
        <a href="williamboman/mason-lspconfig.nvim">mason-lspconfig.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Autocompletion</td>
      <td>
        <a href="https://github.com/hrsh7th/nvim-cmp">nvim-cmp</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/nvim-lualine/lualine.nvim">lualine.nvim</a>
      </td>
      <td>A blazing fast and easy to configure neovim statusline plugin written in pure lua.</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/akinsho/bufferline.nvim">bufferline.nvim</a>
      </td>
      <td>A snazzy bufferline for Neovim</td>
      <td></td>
    </tr>
    <tr>
      <td>EditorConfig plugin for Vim</td>
      <td>
        <a href="https://github.com/editorconfig/editorconfig-vim">editorconfig-vim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/nvim-tree/nvim-tree.lua">nvim-tree.lua</a>
      </td>
      <td>A file explorer tree for neovim written in lua</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/preservim/tagbar">tagbar</a>
      </td>
      <td>Vim plugin that displays tags in a window, ordered by scope</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/echasnovski/mini.nvim">mini.nvim</a>
      </td>
      <td>Library of 30+ independent Lua modules improving overall Neovim (version 0.7 and higher) experience with minimal effort</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/folke/flash.nvim">flash.nvim</a>
      </td>
      <td>Navigate your code with search labels, enhanced character motions and Treesitter integration</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">File searching, previewing image and text files and more with</td>
      <td>
        <a href="https://github.com/nvim-telescope/telescope.nvim">telescope.nvim</a>
      </td>
      <td></td>
      <td>Plugin fzf for telescope</td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/nvim-telescope/telescope-fzf-native.nvim">telescope-fzf-native.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/akinsho/toggleterm.nvim">toggleterm.nvim</a>
      </td>
      <td>A neovim lua plugin to help easily manage multiple terminal windows</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/windwp/nvim-autopairs">nvim-autopairs</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    </tr>
    <tr>
      <td rowspan="3">Support comment</td>
      <td rowspan="1">
        <a href="https://github.com/numToStr/Comment.nvim">Comment.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/JoosepAlviste/nvim-ts-context-commentstring">nvim-ts-context-commentstring</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>
        <a href="folke/todo-comments.nvim">todo-comments.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Support run test</td>
      <td>
        <a href="https://github.com/vim-test/vim-test">vim-test</a>
      </td>
      <td>Run your tests at the speed of thought</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2"></td>
      <td>
        <a href="https://github.com/lukas-reineke/indent-blankline.nvim">indent-blankline.nvim</a>
      </td>
      <td>Indent guides for Neovim</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/lukas-reineke/indent-blankline.nvim">rainbow-delimiters.nvim</a>
      </td>
      <td>Rainbow delimiters for Neovim with Tree-sitter</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/HiPhish/rainbow-delimiters.nvim">nvim-treesitter</a>
      </td>
      <td>Nvim Treesitter configurations and abstraction layer</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/danymat/neogen">neogen</a>
      </td>
      <td>A better annotation generator. Supports multiple languages and annotation conventions.</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">Git support</td>
      <td rowspan="1">
        <a href="https://github.com/tpope/vim-fugitive">vim-fugitive</a>
      </td>
      <td>fugitive.vim: A Git wrapper so awesome, it should be illegal</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/lewis6991/gitsigns.nvim">gitsigns.nvim</a>
      </td>
      <td>Git integration for buffers</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/wakatime/vim-wakatime">vim-wakatime</a>
      </td>
      <td>Vim plugin for automatic time tracking and metrics generated from your programming activity.</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">Support Database Management</td>
      <td rowspan="1">
        <a href="https://github.com/tpope/vim-dadbod">vim-dadbod</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/kristijanhusak/vim-dadbod-ui">vim-dadbod-ui</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/nvimdev/dashboard-nvim">dashboard-nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td>
        <a href="https://github.com/folke/which-key.nvim">which-key.nvim</a>
      </td>
      <td>Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.</td>
      <td></td>
    </tr>
  </tbody>
</table>