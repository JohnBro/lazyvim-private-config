-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_private_" .. name, { clear = false })
end

-- Autocmds for number display
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup("numbertoggle"),
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup("numbertoggle"),
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         vim.cmd [[redraw]]
      end
   end,
})

-- Autocmds for cursorline display
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup("cursortoggle"),
  callback = function()
    if (not vim.o.cursorline) and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.cursorline = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup("cursortoggle"),
  callback = function()
    if vim.o.cursorline then
      vim.opt.cursorline = false
    end
  end,
})
