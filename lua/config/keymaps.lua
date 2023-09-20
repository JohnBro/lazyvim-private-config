-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function unmap(mode, lhs, opts)
  opts = opts or {}
  vim.keymap.del(mode, lhs, opts)
end

map("i", "jk", "<Esc>", { silent = true, noremap = true })

-- floating terminal
local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end
-- FIXME: it doesn't work not, https://github.com/LazyVim/LazyVim/discussions/1333
unmap({ "n", "t" }, "<c-/>")
map("n", "<c-space>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<C-space>", "<cmd>close<cr>", { desc = "Hide Terminal" })
