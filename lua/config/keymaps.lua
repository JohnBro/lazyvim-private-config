-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

  vim.keymap.set(mode, lhs, rhs, options)
end

local function unmap(mode, key, opts)
  opts = opts or {}
  vim.keymap.del(mode, key, opts)
end

-- stylelua: ignore start
-- unmap default mappings
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
unmap("n", "<S-h>")
unmap("n", "<S-l>")

-- basic mappings
map("i", "jk", "<Esc>", { silent = true })

-- Coding
map("i", "<Up>", "<C-p>", { silent = false })
map("n", "<Down>", "<C-n>", { silent = false })

-- Editor
map("n", "<leader>bo", "<cmd>e #<cr>", { desc = "Switch Other Buffer" })
if Util.has("telescope.nvim") then
  map("n", "<leader>bb", "<cmd>Telescope buffers show_all_buffers=true <cr>", { desc = "Switch Buffer" })
end
if Util.has("bufferline.nvim") then
  map("n", "H", "<cmd>BufferLineCyclePrev <cr>", { desc = "Previous Buffer" })
  map("n", "L", "<cmd>BufferLineCycleNext <cr>", { desc = "Next Buffer" })
  map({ "n", "v" }, "<leader>be", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick Close" })
  map({ "n", "v" }, "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close Left" })
  map({ "n", "v" }, "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close Right" })
  map({ "n", "v" }, "<leader>bO", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close Others" })
  map({ "n", "v" }, "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
  map({ "n", "v" }, "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
  map({ "n", "v" }, "<leader>bj", "<Cmd>BufferLinePick<CR>", { desc = "Jump Buffer" })
  map({ "n", "v" }, "<leader>bD", "<Cmd>BufferLineSortByDirectory<CR>", { desc = "Sort by Directory" })
  map({ "n", "v" }, "<leader>bL", "<Cmd>BufferLineSortByExtension<CR>", { desc = "Sort by Language" })
end

-- command mode mappings
map("c", "<C-a>", "<C-b>", { silent = false })
map("c", "<Up>", "<C-p>", { silent = false })
map("c", "<Down>", "<C-n>", { silent = false })
