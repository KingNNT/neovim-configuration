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

## Plugins list
<table>
  <thead>
    <tr>
      <th colspan="1">Order</th>
      <th colspan="1">Feature</th>
      <th colspan="2">Plugin</th>
      <th colspan="1">Note</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Support function neovim </td>
      <td>
        <a href="https://github.com/nvim-lua/plenary.nvim">plenary.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>2</td>
      <td>Default setting neovim</td>
      <td>
        <a href="https://github.com/tpope/vim-sensible">vim-sensible</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">3</td>
      <td rowspan="2">Theme</td>
      <td rowspan="1">
        <a href="https://github.com/oxfist/night-owl.nvim">night-owl</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="1">
        <a href="https://github.com/folke/tokyonight.nvim">tokyonight.nvim</a>
      </td>
      <td></td>
      <td>Default: disabled</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Icon fonts</td>
      <td>
        <a href="https://github.com/nvim-tree/nvim-web-devicons"> nvim-web-devicons </a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>5</td>
      <td>NeoVim LSP configuration (not build-in)</td>
      <td>
        <a href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>6</td>
      <td>NeoVim LSP configuration (build-in)</td>
      <td>
        <a href="https://github.com/neoclide/coc.nvim">coc.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>7</td>
      <td>Autocompletion</td>
      <td>
        <a href="https://github.com/hrsh7th/nvim-cmp">nvim-cmp</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>8</td>
      <td>Neovim statusline</td>
      <td>
        <a href="https://github.com/preservim/tagbar">tagbar</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>9</td>
      <td>File explorer tree</td>
      <td>
        <a href="https://github.com/nvim-tree/nvim-tree.lua">nvim-tree.lua</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">10</td>
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
      <td>11</td>
      <td>A neovim lua plugin to help easily manage multiple terminal windows</td>
      <td>
        <a href="https://github.com/akinsho/toggleterm.nvim">toggleterm.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>12</td>
      <td></td>
      <td>
        <a href="https://github.com/windwp/nvim-autopairs">nvim-autopairs</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    </tr>
    <tr>
      <td>13</td>
      <td></td>
      <td>
        <a href="https://github.com/mattn/emmet-vim">emmet-vim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>14</td>
      <td>Support fast and smart comment</td>
      <td>
        <a href="https://github.com/numToStr/Comment.nvim">Comment.nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>15</td>
      <td>Support smart comment for typescript</td>
      <td>
        <a href="https://github.com/JoosepAlviste/nvim-ts-context-commentstring">nvim-ts-context-commentstring</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>16</td>
      <td>Support run test</td>
      <td>
        <a href="https://github.com/vim-test/vim-test">vim-test</a>
      </td>
      <td>Run your tests at the speed of thought</td>
      <td></td>
    </tr>
    <tr>
      <td>17</td>
      <td></td>
      <td>
        <a href="https://github.com/lukas-reineke/indent-blankline.nvim">indent-blankline.nvim</a>
      </td>
      <td>Indent guides for Neovim</td>
      <td></td>
    </tr>
    <tr>
      <td>18</td>
      <td></td>
      <td>
        <a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter</a>
      </td>
      <td>Nvim Treesitter configurations and abstraction layer</td>
      <td></td>
    </tr>
    <tr>
      <td>19</td>
      <td></td>
      <td>
        <a href="https://github.com/puremourning/vimspector">vimspector</a>
      </td>
      <td>vimspector - A multi-language debugging system for Vim</td>
      <td></td>
    </tr>
    <tr>
      <td>20</td>
      <td></td>
      <td>
        <a href="https://github.com/tpope/vim-fugitive">vim-fugitive</a>
      </td>
      <td>fugitive.vim: A Git wrapper so awesome, it should be illegal</td>
      <td></td>
    </tr>
    <tr>
      <td>21</td>
      <td></td>
      <td>
        <a href="https://github.com/lewis6991/gitsigns.nvim">gitsigns.nvim</a>
      </td>
      <td>Git integration for buffers</td>
      <td></td>
    </tr>
    <tr>
      <td>22</td>
      <td></td>
      <td>
        <a href="https://github.com/wakatime/vim-wakatime">vim-wakatime</a>
      </td>
      <td>Vim plugin for automatic time tracking and metrics generated from your programming activity.</td>
      <td></td>
    </tr>
    <tr>
      <td>22</td>
      <td></td>
      <td>
        <a href="https://github.com/tpope/vim-dadbod">vim-dadbod</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>22</td>
      <td></td>
      <td>
        <a href="https://github.com/kristijanhusak/vim-dadbod-ui">vim-dadbod-ui</a>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>23</td>
      <td></td>
      <td>
        <a href="https://github.com/nvimdev/dashboard-nvim">dashboard-nvim</a>
      </td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>