-- Configurations when using vscode-neovim.
-- Modified from https://github.com/LazyVim/LazyVim/raw/main/lua/lazyvim/plugins/extras/vscode.lua
if not vim.g.vscode then
  return {}
end

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
  "nvim-ts-rainbow2", -- not used but required for loading treesitter
  "vim-repeat",
  "LazyVim",
}

local Config = require("lazy.core.config")
local Plugin = require("lazy.core.plugin")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    vim.opt.timeoutlen = 500 -- vscode has a slow response then nvim itself
    vim.keymap.set("n", "H", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>")
    vim.keymap.set("n", "L", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>")
    vim.keymap.set("n", "gr", "<cmd>call VSCodeNotify('references-view.findReferences')<cr>")
    vim.keymap.set("n", "<Tab>", "<cmd>call VSCodeNotify('editor.toggleFold')<cr>")
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
    vim.keymap.set("n", "<leader>bb", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>")
    vim.keymap.set("n", "<localleader>ul", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>")
    vim.keymap.set("n", "<localleader>ur", "<cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<cr>")
    vim.keymap.set("n", "<localleader>ua", "<cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<cr>")
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false }, rainbow = { enable = false } },
  },
}
