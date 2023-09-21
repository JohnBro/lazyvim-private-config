# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## installation

### Prerequisites

- Make sure you installed the latest [neovim](https://github.com/neovim/neovim/releases/tag/stable) stable version.
- Have [git](https://cli.github.com), [make](https://www.gnu.org/software/make/), [pip](https://pypi.org/project/pip/), [python](https://www.python.org/), [npm](https://npmjs.com/), [node](https://nodejs.org/) and cargo installed on your system.
- Resolve [EACCES permissions when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) to avoid error when installing packages with npm.
- [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) (for Windows)

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
git clone https://git.johnbro.cn/Johnbro/lazyvim_private ~/.config/nvim
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
