# 💤 LazyVim

This is my private confif with [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

- [💤 LazyVim](#-lazyvim)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Unix/Linux](#unixlinux)
    - [Windows](#windows)
  - [Keymaps](#keymaps)
    - [General](#general)
    - [LSP](#lsp)
    - [bufferline.nvim #Ui](#bufferlinenvim-ui)
    - [flash.nvim #Plugins #Editor #VSCode](#flashnvim-plugins-editor-vscode)
    - [Mason.nvim #Plugins #Lsp](#masonnvim-plugins-lsp)
    - [mini.bufremove #Plugins #Editor](#minibufremove-plugins-editor)
    - [mini.pairs #Plugins #Coding](#minipairs-plugins-coding)
    - [mini.surround #Plugins #Coding #VSCode](#minisurround-plugins-coding-vscode)
    - [mini.comment #Plugins #Coding #VSCode](#minicomment-plugins-coding-vscode)
    - [neo-tree.nvim #Plugins #Editor](#neo-treenvim-plugins-editor)
    - [noice.nvim #Plugins #Ui](#noicenvim-plugins-ui)
    - [nvim-notify #Plugins #Ui](#nvim-notify-plugins-ui)
    - [nvim-spectre #Plugins #Editor](#nvim-spectre-plugins-editor)
    - [nvim-treesitter #Plugins #Treesitter](#nvim-treesitter-plugins-treesitter)
    - [nvim-treesitter-textobjects #Plugins #Treesitter #VSCode](#nvim-treesitter-textobjects-plugins-treesitter-vscode)
    - [persistence.nvim #Plugins #Util](#persistencenvim-plugins-util)
    - [telescope.nvim #Plugins #Editor](#telescopenvim-plugins-editor)
    - [todo-comments.nvim #Plugins #Editor](#todo-commentsnvim-plugins-editor)
    - [trouble.nvim #Plugins #Editor](#troublenvim-plugins-editor)
    - [vim-illuminate #Plugins #Editor](#vim-illuminate-plugins-editor)
    - [gitsigns.nvim #Plugins #Editor](#gitsignsnvim-plugins-editor)
    - [edgy.nvim #Extras #Ui](#edgynvim-extras-ui)
    - [project.nvim #Extras #Util](#projectnvim-extras-util)
    - [VSCode-Neovim #Extras #VSCode](#vscode-neovim-extras-vscode)
    - [multicursors.nvim #User #Editor](#multicursorsnvim-user-editor)
    - [align.nvim #User #Editor #VSCode](#alignnvim-user-editor-vscode)
  - [Confiugration](#confiugration)
    - [Dashboard](#dashboard)
    - [Vscode](#vscode)

## Installation

![dashboard](./.assert/image.png)

### Prerequisites

- Make sure you installed the latest [neovim](https://github.com/neovim/neovim/releases/tag/stable) stable version.
- Have [git](https://cli.github.com), [make](https://www.gnu.org/software/make/), [pip](https://pypi.org/project/pip/), [python](https://www.python.org/), [npm](https://npmjs.com/), [node](https://nodejs.org/) and cargo installed on your system.
- Resolve [EACCES permissions when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) to avoid error when installing packages with npm.
- [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) (for Windows)
- [virtualenv](https://pypi.org/project/virtualenv/) should be installed.

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

4. Run `:checkhealth` to see if any error/warning, then please solve it.

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

4. Run `:checkhealth` to see if any error/warning, then please solve it.

## Keymaps

I have many self customization based on LazyVim defaults, regards to all the defaults of LazyVim keymsp, please refer 
to <https://www.lazyvim.org/keymaps>.

- Default `<leader>` is `<space>`.
- Default `<localleader>` is changed as `,`

### General

**Note that** general keymaps won't take effect in vscode mode.

| Key                                             | Description                           | Mode               | Note                |
| :---------------------------------------------- | :------------------------------------ | :----------------- | :------------------ |
| **`n`**                                         | Motion with `zz`                      | `nzz`              | New add             |
| **`N`**                                         | Motion with `zz`                      | `Nzz`              | New add             |
| **`G`**                                         | Motion with `zz`                      | `Gzz`              | New add             |
| **`{`**                                         | Motion with `zz`                      | `{zz`              | New add             |
| **`}`**                                         | Motion with `zz`                      | `i`                | New add             |
| **`jk`**                                        | Enter normal mode                     | `i`                | New add             |
| `j`                                             | Motion with `g`                       | `gj`               | Keep with LazyVim   |
| `k`                                             | Motion with `g`                       | `gk`               | Keep with LazyVim   |
| `<C-h>`,`<C-j>`,`<C-k>`, `<C-l>`                | Window motion                         | `n`,`t`            | Keep with LazyVim   |
| `<C-Up>`, `<C-Down>`, `<C-Left>`, `<C-Right>`   | Window width/height adjustment        | `n`                | Keep with LazyVim   |
| `<A-j>`, `<A-k>`                                | Move down/up                          | `n`, `i`, `v`      | Keep with LazyVim   |
| ~~`H`~~, ~~`L`~~, `[b`, `]b`                    | Pre/Next buffer                       | `n`                | Delete from LazyVim |
| ~~`<leader>bb`~~, ``<leader>` ``                | Switch to other buffer                | `n`                | Keep with LazyVim   |
| **`<leader>bo`**                                | Switch to other buffer                | `n`                | Keep with LazyVim   |
| `<leader>ur`                                    | Redraw / clear hlsearch / diff update | `n`                | Keep with LazyVim   |
| `<C-s>`                                         | Save file                             | `n`, `v`, `x`, `i` | Keep with LazyVim   |
| `<leader>K`, `K`                                | Keywordprg                            | `n`                | Keep with LazyVim   |
| ~~`<leader>l`~~, **`<leader>hl`**               | Lazy                                  | `n`                | Modify from LazyVim |
| `<leader>fn`                                    | New file                              | `n`                | Keep with LazyVim   |
| `<leader>xl`                                    | Location list                         | `n`                | Keep with LazyVim   |
| `<leader>xq`                                    | Quickfix list                         | `n`                | Keep with LazyVim   |
| `<leader>uf`                                    | Toggle format on save                 | `n`                | Keep with LazyVim   |
| `<leader>us`                                    | Toggle spelling                       | `n`                | Keep with LazyVim   |
| `<leader>uw`                                    | Toggle word wrap                      | `n`                | Keep with LazyVim   |
| `<leader>ul`                                    | Toggle line numbers                   | `n`                | Keep with LazyVim   |
| `<leader>ud`                                    | Toggle Diagnostics                    | `n`                | Keep with LazyVim   |
| `<leader>uc`                                    | Toggle Conceal                        | `n`                | Keep with LazyVim   |
| `<leader>uh`                                    | Toggle Inlay Hints                    | `n`                | Keep with LazyVim   |
| `<leader>gg`, `<leader>gG`                      | Lazygit (root dir), Lazygit (cwd)     | `n`                | Keep with LazyVim   |
| `Inspect Pos`                                   | Inspect Pos                           | `n`                | Keep with LazyVim   |
| ~~`<leader>L`~~, **`<leader>hL`**               | LazyVim Changelog                     | `n`                | Modify from LazyVim |
| `<leader>fT`, `<leader>ft`                      | Terminal (root dir) or Terminal (cwd) | `n`                | Keep with LazyVim   |
| `<C-/>`                                         | Terminal (root dir)                   | `n`                | Keep with LazyVim   |
| `<C-_>`                                         | which_key_ignore                      | `n`, `t`           | Keep with LazyVim   |
| `<Esc><Esc>`                                    | Enter normal mode                     | `n`, `t`           | Keep with LazyVim   |
| `<C-/>`                                         | Hide terminal                         | `t`                | Keep with LazyVim   |
| `<leader>ww`, `<leader>ww`                      | Other window, delete window           | `n`                | Keep with LazyVim   |
| `<leader>w-`, `<leader>w\|`                     | Split window right or below           | `n`                | Keep with LazyVim   |
| `<leader>-`, `<leader>\|`                       | Split window right or below           | `n`                | Keep with LazyVim   |
| `<leader><Tab>l`                                | Last tab                              | `n`                | Keep with LazyVim   |
| `<leader><tab>f`                                | First tab                             | `n`                | Keep with LazyVim   |
| `<leader><tab><tab>`                            | New tab                               | `n`                | Keep with LazyVim   |
| **`]<Tab>`**, `<leader><tab>]`                  | Next tab                              | `n`                | Modify from LazyVim |
| **`[<Tab>`**, `<leader><tab>[`                  | Previous tab                          | `n`                | Modify LazyVim      |
| `<leader><tab>d`                                | Close tab                             | `n`                | Keep with LazyVim   |
| **`<C-a>`**                                     | `<C-b>`, move to beginning            | `c`                | New add             |
| **`<Up>`**                                      | `<C-p>`, Previous select              | `c`                | New add             |
| **`<Down>`**                                    | `<C-n>`, Next select                  | `c`                | New add             |
| **`<leader>D`**                                 | Dashboard                             | `n`                | New add             |

### LSP

|     Key      |      Description       |   Mode   |
| :----------- | :--------------------- | :------- |
| `<leader>cd` | Line Diagnostics       | `n`      |
| `<leader>cl` | Lsp Info               | `n`      |
| `gd`         | Goto Definition        | `n`      |
| `gr`         | References             | `n`      |
| `gD`         | Goto Declaration       | `n`      |
| `gI`         | Goto Implementation    | `n`      |
| `gy`         | Goto T[y]pe Definition | `n`      |
| `K`          | Hover                  | `n`      |
| `gK`         | Signature Help         | `n`      |
| `<c-k>`      | Signature Help         | `i`      |
| `]d`         | Next Diagnostic        | `n`      |
| `[d`         | Prev Diagnostic        | `n`      |
| `]e`         | Next Error             | `n`      |
| `[e`         | Prev Error             | `n`      |
| `]w`         | Next Warning           | `n`      |
| `[w`         | Prev Warning           | `n`      |
| `<leader>cf` | Format Document        | `n`      |
| `<leader>cf` | Format Range           | `v`      |
| `<leader>ca` | Code Action            | `n`, `v` |
| `<leader>cA` | Source Action          | `n`      |
| `<leader>cr` | Rename                 | `n`      |

### [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git) #Ui

|       Key        |        Description        | Mode |
| :--------------- | :------------------------ | :--- |
| ~~`<leader>bp`~~ | Toggle  pin               | `n`  |
| ~~`<leader>bP`~~ | Delete non-pinned buffers | `n`  |
| `<leader>be`     | Pick Close buffers        | `n`  |
| `<leader>bh`     | Close Left buffers        | `n`  |
| `<leader>bl`     | Close Right buffers       | `n`  |
| `<leader>bO`     | Close Other buffers       | `n`  |
| `<leader>bn`     | Next buffer               | `n`  |
| `<leader>bp`     | Previous buffer           | `n`  |
| `<leader>bj`     | Jump buffer               | `n`  |
| `<leader>bD`     | Sort by Directory         | `n`  |
| `<leader>bL`     | Sort by Language          | `n`  |

### [flash.nvim](https://github.com/folke/flash.nvim.git) #Plugins #Editor #VSCode

|   Key   |     Description     |     Mode      |
| :------ | :------------------ | :------------ |
| `s`     | Flash               | `n`, `x`, `o` |
| `S`     | Flash Treesitter    | `n`, `o`, `x` |
| `r`     | Remote Flash        | `o`           |
| `R`     | Treesitter Search   | `o`, `x`      |
| `<c-s>` | Toggle Flash Search | `c`           |

### [Mason.nvim](https://github.com/williamboman/mason.nvim.git) #Plugins #Lsp

|     Key      | Description | Mode |
| :----------- | :---------- | :--- |
| `<leader>cm` | Mason       | `n`  |

### [mini.bufremove](https://github.com/echasnovski/mini.bufremove.git) #Plugins #Editor

| Key              | Description           | Mode |
| :--------------- | :-------------------- | :--- |
| `<leader>bd`     | Delete Buffer         | `n`  |
| ~~`<leader>bD`~~ | Delete Buffer (Force) | `n`  |

### [mini.pairs](https://github.com/echasnovski/mini.pairs.git) #Plugins #Coding

|     Key      |    Description    | Mode |
| :----------- | :---------------- | :--- |
| `<leader>up` | Toggle auto pairs | `n`  |

### [mini.surround](https://github.com/echasnovski/mini.surround.git) #Plugins #Coding #VSCode

| Key   | Description                        | Mode     |
| :---- | :--------------------------------- | :------- |
| `gsa` | Add surrounding                    | `n`, `v` |
| `gsd` | Delete surrounding                 | `n`      |
| `gsf` | Find right surrounding             | `n`      |
| `gsF` | Find left surrounding              | `n`      |
| `gsh` | Highlight surrounding              | `n`      |
| `gsr` | Replace surrounding                | `n`      |
| `gsn` | Update MiniSurround.config.n_lines | `n`      |

### [mini.comment](https://github.com/echasnovski/mini.comment) #Plugins #Coding #VSCode

| Key   | Description                                | Mode          |
| ----- | ------------------------------------------ | ------------- |
| `gc`  | Toggle comment for a text or selected text | `n`, `x`, `o` |
| `gcc` | Toggle comment a line                      | `n`           |

### [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim.git) #Plugins #Editor

|     Key      |         Description         | Mode |
| :----------- | :-------------------------- | :--- |
| `<leader>fe` | Explorer NeoTree (root dir) | `n`  |
| `<leader>fE` | Explorer NeoTree (cwd)      | `n`  |
| `<leader>e`  | Explorer NeoTree (root dir) | `n`  |
| `<leader>E`  | Explorer NeoTree (cwd)      | `n`  |

### [noice.nvim](https://github.com/folke/noice.nvim.git) #Plugins #Ui

|      Key      |    Description     |     Mode      |
| :------------ | :----------------- | :------------ |
| `<S-Enter>`   | Redirect Cmdline   | `c`           |
| `<leader>snl` | Noice Last Message | `n`           |
| `<leader>snh` | Noice History      | `n`           |
| `<leader>sna` | Noice All          | `n`           |
| `<leader>snd` | Dismiss All        | `n`           |
| `<c-f>`       | Scroll forward     | `i`, `n`, `s` |
| `<c-b>`       | Scroll backward    | `i`, `n`, `s` |

### [nvim-notify](https://github.com/rcarriga/nvim-notify.git) #Plugins #Ui

|     Key      |        Description        | Mode |
| :----------- | :------------------------ | :--- |
| `<leader>un` | Dismiss all Notifications | `n`  |

### [nvim-spectre](https://github.com/nvim-pack/nvim-spectre.git) #Plugins #Editor

|     Key      |        Description         | Mode |
| :----------- | :------------------------- | :--- |
| `<leader>sr` | Replace in files (Spectre) | `n`  |

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git) #Plugins #Treesitter

| Key                          | Description           | Mode |
| :--------------------------- | :-------------------- | :--- |
| ~~`<c-space>`~~, **<Enter>** | Incremental selection | `n`  |
| `<bs>`                       | Decrement selection   | `x`  |
| `]f`                         | Next func begin       | `n`  |
| `]F`                         | Next func end         | `n`  |
| `[f`                         | Previous func begin   | `n`  |
| `[F`                         | Previous func end     | `n`  |

### [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) #Plugins #Treesitter #VSCode

Select, Swap, Move, ... based on text object. Please refer to <https://github.com/nvim-treesitter/nvim-treesitter-textobjects> for details.

### [persistence.nvim](https://github.com/folke/persistence.nvim.git) #Plugins #Util

|     Key      |        Description         | Mode |
| :----------- | :------------------------- | :--- |
| `<leader>qs` | Restore Session            | `n`  |
| `<leader>ql` | Restore Last Session       | `n`  |
| `<leader>qd` | Don't Save Current Session | `n`  |

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git) #Plugins #Editor

|                Key                 |       Description        | Mode |
| :--------------------------------- | :----------------------- | :--- |
| ~~`<leader>,`~~, **`<leader>bb`**  | Switch Buffer            | `n`  |
| `<leader>/`                        | Grep (root dir)          | `n`  |
| `<leader>:`                        | Command History          | `n`  |
| `<leader><space>`                  | Find Files (root dir)    | `n`  |
| ~~`<leader>fb`~~, **`<leader>bb`** | Buffers                  | `n`  |
| `<leader>ff`                       | Find Files (root dir)    | `n`  |
| `<leader>fF`                       | Find Files (cwd)         | `n`  |
| `<leader>fr`                       | Recent                   | `n`  |
| `<leader>fR`                       | Recent (cwd)             | `n`  |
| `<leader>gc`                       | commits                  | `n`  |
| `<leader>gs`                       | status                   | `n`  |
| ~~`<leader>s"`~~，**`<leader>h"`** | Registers                | `n`  |
| ~~`<leader>sa`~~，**`<leader>ha`** | Auto Commands            | `n`  |
| `<leader>sb`                       | Buffer                   | `n`  |
| ~~`<leader>sc`~~，**`<leader>hc`** | Command History          | `n`  |
| ~~`<leader>sC`~~，**`<leader>hC`** | Commands                 | `n`  |
| `<leader>sd`                       | Document diagnostics     | `n`  |
| `<leader>sD`                       | Workspace diagnostics    | `n`  |
| `<leader>sg`                       | Grep (root dir)          | `n`  |
| `<leader>sG`                       | Grep (cwd)               | `n`  |
| ~~`<leader>sh`~~, **`<leader>hh`** | Help Pages               | `n`  |
| ~~`<leader>sH`~~, **`<leader>hH`** | Search Highlight Groups  | `n`  |
| ~~`<leader>sk`~~, **`<leader>hk`** | Key Maps                 | `n`  |
| ~~`<leader>sM`~~, **`<leader>hm`** | Man Pages                | `n`  |
| `<leader>sm`                       | Jump to Mark             | `n`  |
| ~~`<leader>so`~~, **`<leader>ho`** | Options                  | `n`  |
| ~~`<leader>sR`~~, **`<leader>hR`** | Resume                   | `n`  |
| `<leader>sw`                       | Word (root dir)          | `n`  |
| `<leader>sW`                       | Word (cwd)               | `n`  |
| `<leader>sw`                       | Selection (root dir)     | `v`  |
| `<leader>sW`                       | Selection (cwd)          | `v`  |
| `<leader>uC`                       | Colorscheme with preview | `n`  |
| `<leader>ss`                       | Goto Symbol              | `n`  |
| `<leader>sS`                       | Goto Symbol (Workspace)  | `n`  |
| **`<leader>hP`**                   | Find Plugin Files        | `n`  |
| **`<leader>fb`**                   | Telescope file_browser   | `n`  |

### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git) #Plugins #Editor

|     Key      |       Description        | Mode |
| :----------- | :----------------------- | :--- |
| `]t`         | Next todo comment        | `n`  |
| `[t`         | Previous todo comment    | `n`  |
| `<leader>xt` | Todo (Trouble)           | `n`  |
| `<leader>xT` | Todo/Fix/Fixme (Trouble) | `n`  |
| `<leader>st` | Todo                     | `n`  |
| `<leader>sT` | Todo/Fix/Fixme           | `n`  |

### [trouble.nvim](https://github.com/folke/trouble.nvim.git) #Plugins #Editor

|     Key      |           Description           | Mode |
| :----------- | :------------------------------ | :--- |
| `<leader>xx` | Document Diagnostics (Trouble)  | `n`  |
| `<leader>xX` | Workspace Diagnostics (Trouble) | `n`  |
| `<leader>xL` | Location List (Trouble)         | `n`  |
| `<leader>xQ` | Quickfix List (Trouble)         | `n`  |
| `[q`         | Previous trouble/quickfix item  | `n`  |
| `]q`         | Next trouble/quickfix item      | `n`  |

### [vim-illuminate](https://github.com/RRethy/vim-illuminate.git) #Plugins #Editor

| Key  |  Description   | Mode |
| :--- | :------------- | :--- |
| `]]` | Next Reference | n    |
| `[[` | Prev Reference | n    |

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) #Plugins #Editor

| Key               | Description                  | Mode     |
| :---------------- | :--------------------------- | :------- |
| `]h`              | Next hunk                    | `n`      |
| `[h`              | Previous hunk                | `n`      |
| `<leader>ghb`     | blame line with float window | `n`      |
| `<leader>ghd`     | Diff this                    | `n`      |
| `<leader>ghD`     | Diff this ~                  | `n`      |
| `<leader>ghp`     | Preview hunk                 | `n`      |
| `<leader>ghr`     | Reset hunk                   | `n`, `v` |
| `<leader>ghR`     | Reset buffer                 | `n`      |
| `<leader>ghs`     | Stage hunk                   | `n`, `v` |
| `<leader>ghS`     | Stage buffer                 | `n`      |
| `<leader>ghu`     | Undo stage hunk              | `n`      |
| `ih`              | Select hunk                  | `x`, `o` |
| **`<leader>ugb`** | toogle line blame            | `n`      |
| **`<leader>ugg`** | toggle diff inline           | `n`      |
| **`<leader>ugl`** | toggle line highlight        | `n`      |
| **`<leader>ugn`** | toggle number hightlight     | `n`      |

### [edgy.nvim](https://github.com/folke/edgy.nvim.git) #Extras #Ui

Part of [lazyvim.plugins.extras.ui.edgy](https://www.lazyvim.org/extras/ui/edgy).

|     Key      |    Description     | Mode |
| :----------- | :----------------- | :--- |
| `<leader>ue` | Edgy Toggle        | `n`  |
| `<leader>uE` | Edgy Select Window | `n`  |

### [project.nvim](https://github.com/ahmedkhalf/project.nvim.git) #Extras #Util

Part of [lazyvim.plugins.extras.util.project](https://www.lazyvim.org/extras/util/project)

|     Key      | Description | Mode |
| :----------- | :---------- | :--- |
| `<leader>fp` | Projects    | `n`  |

### [VSCode-Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) #Extras #VSCode

| Key               | Description               | Mode |
| :---------------- | :------------------------ | :--- |
| `<leader><space>` | Find                      | `n`  |
| `<leader>/`       | Find in file              | `n`  |
| `<leader>ss`      | Go to symbol              | `n`  |
| **`<tab>`**       | Toggle fold               | `n`  |
| **`za`**          | Toggle fold               | `n`  |
| **`zc`**          | Fold                      | `n`  |
| **`zC`**          | Fola all                  | `n`  |
| **`zo`**          | Unfold                    | `n`  |
| **`zO`**          | Unfold                    | `n`  |
| **`zR`**          | Unfold Recursively        | `n`  |
| **`j`**           | `gj`                      | `n`  |
| **`k`**           | `gk`                      | `n`  |
| **`<leader>bn`**  | Next Editor               | `n`  |
| **`<leader>bp`**  | Previous Editor           | `n`  |
| **`<leader>bb`**  | Quick Open                | `n`  |
| **`<leader>bd`**  | Close Active Editor       | `n`  |
| **`<leader>bO`**  | Close Other Editors       | `n`  |
| **`<leader>ul`**  | Toggle sidebar visibility | `n`  |
| **`<leader>ur`**  | Toggle right sidebar      | `n`  |
| **`<leader>ua`**  | Toggle Activity bar       | `n`  |

### [multicursors.nvim](https://github.com/smoka7/multicursors.nvim) #User #Editor

| Key         | Description                 | Mode     |
| :---------- | :-------------------------- | :------- |
| **`<C-n>`** | Multicursor start to select | `n`, `v` |

### [align.nvim](https://github.com/Vonr/align.nvim) #User #Editor #VSCode

`ga` as the leader to align the text, can be used in VSCode.

| Key       | Description            | Mode     |
| --------- | ---------------------- | -------- |
| **`gaa`** | Align to a char        | `n`, `x` |
| **`gas`** | Align to 2 chars       | `x`      |
| **`gaw`** | Align to a string      | `x`, `n` |
| **`gar`** | Align to a lua pattern | `x`      |

## Confiugration

### Dashboard

Please refer to [ui.lua](./lua/plugins/ui.lua). Modified from LazyVim:
1. Change the dashboard logo to what i like.
2. Add more startup menu item and decrease the padding.

### Vscode

1. Please install `vscode-neovim` and `Neovim Ui Modifier` in your vscode. WSL should also install `Neovim Ui Modifier` in remote.
2. Please set neovim path in settings.
3. LazyVim has some default vscode settings, please refer to <https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/vscode.lua>.

If you want to add more plugins support for vscode, please choose a good:
1. add `vscode = true` into plugin configuration.
2. add `cond = vim.g.vscode` into plugin configuration. I think this way is better.

LazyVim default enable below plugins + `flash.nvim`:

```lua
local enabled = {
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "LazyVim",
}
```
Please check [plugins/vscode.lua](./lua/plugins/vscode.lua) for my customization for vscode.
