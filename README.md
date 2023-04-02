# NeoVim Configuration

This repo contains my private configuration for NeoVim. I try to give you concrete setup information, so you can create your own experience!

## Setup

This configuration uses [packer.nvim](https://github.com/wbthomason/packer.nvim) for plugin management.

To install packer, simply run the following:

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then, simply clone (or link) this repo to your local neovim config location, e.g.:

```shell
ln -s $(pwd) ~/.config/nvim
```

After starting NeoVim, run `:PackerSync` to install all plugins.
