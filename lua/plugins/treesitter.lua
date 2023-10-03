-- Rfer to https://www.lazyvim.org/configuration/plugins
--[[
Defaults merging rules:

cmd: the list of commands will be extended with your custom commands
event: the list of events will be extended with your custom events
ft: the list of filetypes will be extended with your custom filetypes
keys: the list of keymaps will be extended with your custom keymaps
opts: your custom opts will be merged with the default opts
dependencies: the list of dependencies will be extended with your custom dependencies
any other property will override the defaults
For ft, event, keys, cmd and opts you can instead also specify a values function that
can make changes to the default values, or return new values to be used instead.
]]
--
return {
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    rainbow = { enable = true },
    opts = function(_, opts)
      if not vim.g.vscode then
        opts.rainbow = {
          enable = true,
          query = "rainbow-parens",
          strategy = require("ts-rainbow").strategy.global,
        }
      end
      opts.ensure_installed = {
        "bash",
        "blueprint",
        "c",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "glsl",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "kotlin",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "make",
        "org",
        "python",
        "regex",
        "rst",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      }
      opts.keys = {
        { "<c-space>", false },
        { "<Enter>", desc = "Increment selection" },
      }
    end,
  },
}
