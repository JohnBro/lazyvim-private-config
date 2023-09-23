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

-- stylelua: ignore start
-- unmap default mappings
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
unmap("n", "<S-h>")
unmap("n", "<S-l>")

-- nomrla mode mappings
if Util.has("telescope.nvim") then
  map("n", "<leader>bb", "<cmd>Telescope buffers show_all_buffers=true <cr>", { desc = "Switch Buffer", remap = false })
end
if Util.has("bufferline.nvim") then
  map("n", "H", "<cmd>BufferLineCyclePrev <cr>", { desc = "Previous Buffer" })
  map("n", "L", "<cmd>BufferLineCycleNext <cr>", { desc = "Next Buffer" })
end

-- insert mode mappings
map("i", "jk", "<Esc>", { silent = true })

-- command mode mappings
map("c", "<C-a>", "<C-b>", { silent = true })
