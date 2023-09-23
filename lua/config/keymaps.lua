-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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

-- nomrla mode mappings
if vim.fn.exists(":Telescope") > 0 then
  map("n", "<leader>bb", "<CMD>Telescope buffers show_all_buffers=true <CR>", { silent = true, noremap = true })
end

-- insert mode mappings
map("i", "jk", "<Esc>", { silent = true, noremap = true })

-- command mode mappings
map("c", "<C-a>", "<C-b>", { silent = true, noremap = true })
