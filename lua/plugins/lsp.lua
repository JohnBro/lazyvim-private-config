-- My customization for https://www.lazyvim.org/plugins/lsp
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        --" stylua",
        -- "shfmt",
        -- "flake8",
      },
    },
  },
}
