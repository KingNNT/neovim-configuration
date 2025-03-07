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

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.10.4-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/KingNNT/KingNNT.svg?style=flat-square&label=Issues&color=d77982)](https://github.com/KingNNT/neovim-configuration)

</div>

## Showcase

![neovim-dashboard-image](./images/dashboard_20250306T201303.png?raw=true)

## What is it?

- It is just a simple neovim config

## Install

### Install Dependencies

- [fd](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)

### Install configuration

```
git clone https://github.com/KingNNT/neovim-configuration ~/.config/nvim --depth 1 && nvim

```

### Install libraries

You can install more library with [mason](https://github.com/williamboman/mason.nvim?tab=readme-ov-file)

#### HTML

- prettier

#### Python

- black
- isort

## Uninstall

- **_Linux / Macos (unix)_**

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

```

## Plugins list

Please read it at `lua/plugins/init.lua`
