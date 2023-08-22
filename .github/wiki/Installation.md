# How to install ?

- Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

I suggest that you should install by `AppImage` if you have used a linux distro, because it will update lastest quickly

- **_Install all [requirement](./Requirements.md)_**

- Clone this repo to path:

```
~/.config/nvim`
```

- If you use `Ubuntu`, you must be install [ctag](https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html)

```
sudo apt update
sudo apt-get install -y universal-ctags
```

- To use `fzf`, to install them library [ripgrep](https://www.linode.com/docs/guides/ripgrep-linux-installation/)

```
sudo apt-get install ripgrep
```

- Open NeoVim and run `:PlugInstall`
