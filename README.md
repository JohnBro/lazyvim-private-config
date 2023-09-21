# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## installation

### Unix/Linux

1. Make a backup of your current Neovim files:
```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
2. Clone the starter
```sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
```
3. Start the Neovim to lazy install all plugins
`nvim`

### Windows

1. Make a backup of your current Neovim files:
```sh
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```
2. clone the private config
```sh
git clone https://git.johnbro.cn/Johnbro/lazyvim_private $env:LOCALAPPDATA\nvim
```
3. Start Neovim to lazy install all plugins
`nvim`

