-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function unmap(mode, key, opts)
  opts = opts or {}
  vim.keymap.del(mode, key, opts)
end

-- stylelua: ignore start
-- unmap default mappings
unmap("n", "<S-h>")
unmap("n", "<S-l>")
unmap("n", "<leader>l")
unmap("n", "<leader>L")

-- basic mappings
map("i", "jk", "<Esc>", { remap = true })
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "G", "Gzz")
map("n", "{", "{zz")
map("n", "}", "}zz")

-- buffers
map("n", "<leader>bo", "<cmd>e #<cr>", { desc = "Switch Other Buffer" })

-- Fix for not work in plugin `keys` mappings
if Util.has("telescope.nvim") then
  map("n", "<leader>bb", "<cmd>Telescope buffers show_all_buffers=true <cr>", { desc = "Switch Buffer" })
end

-- tabs
map("n", "]<Tab>", "<Cmd>tabnext<CR>", { desc = "Next <Tab>" })
map("n", "[<Tab>", "<Cmd>tabprevious<CR>", { desc = "Previous <Tab>" })

-- command mode mappings
map("c", "<C-a>", "<C-b>", { silent = false })
map("c", "<Up>", "<C-p>", { silent = false })
map("c", "<Down>", "<C-n>", { silent = false })

-- LazyVim
map("n", '<leader>hl', "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>hL", Util.changelog, {desc = "LazyVim Changelog"})
