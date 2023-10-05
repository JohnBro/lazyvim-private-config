-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_user_" .. name, { clear = true })
end

local function autocmds_ignore(exclude)
  exclude   = exclude or {}
  local buf = vim.api.nvim_get_current_buf()
  if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
    return true
  end
  return false
end

-- Autocmds for number display
local numtoggle_group = augroup("numtoggle")
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern  = "*",
  group    = numtoggle_group,
  callback = function()
    if autocmds_ignore({ "alpha", "dashbaord" }) then
      return
    end
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern  = "*",
  group    = numtoggle_group,
  callback = function()
    if autocmds_ignore({ "alpha", "dashbaord" }) then
      return
    end
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd [[redraw]]
    end
  end,
})

-- Autocmds for cursorline display
local cursortoggle_group = augroup("cursortoggle")
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern  = "*",
  group    = cursortoggle_group,
  callback = function()
    if autocmds_ignore({ "alpha", "dashbaord" }) then
      return
    end
    if (not vim.o.cursorline) and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.cursorline = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern  = "*",
  group    = cursortoggle_group,
  callback = function()
    if autocmds_ignore({ "alpha", "dashbaord" }) then
      return
    end
    if vim.o.cursorline then
      vim.opt.cursorline = false
    end
  end,
})

-- Disable spellchecking for Markdown, https://github.com/LazyVim/LazyVim/discussions/392
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  group    = augroup("wrap"),
  pattern  = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})
