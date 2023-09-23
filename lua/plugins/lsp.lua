-- My customization for https://www.lazyvim.org/plugins/lsp
return {
  -- Fix clangd offset encoding
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
}
