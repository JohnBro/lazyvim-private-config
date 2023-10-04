-- My customizations of https://www.lazyvim.org/plugins/editor
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 20,
      },
    },
    keys = {
      -- disable the default keymaps
      { "<leader>,", false },
      { "<leader>fb", false },
      { '<leader>s"', false },
      { "<leader>sa", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sD", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>sk", false },
      { "<leader>sM", false },
      { "<leader>so", false },
      { "<leader>sR", false },
      -- buffer
      { "<leader>bb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- helps
      { '<leader>h"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>ha", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>hc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>hC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>hd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>hD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>hH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>ho", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>hR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>hP", function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end, desc = "Find Plugin File" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension "file_browser"
    end,
    keys = {
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Files Browser" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["gs"] = { name = "+surround" },
        ["<leader>h"] = { name = "+help" },
        ["<leader>w"] = { name = "+window" },
        ["<leader>ug"] = { name = "+Gitsigns" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ugb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
      { "<leader>ugg", "<cmd>Gitsigns toggle_word_diff<cr><cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle diff" },
      { "<leader>ugn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Toggle number highlight" },
      { "<leader>ugl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlight" },
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bD", false },
    },
  },
  {
    "smoka7/multicursors.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      'smoka7/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      { mode = { "n", "v"}, "<c-n>", "<cmd>MCstart<cr>", desc = "Multicursor Start" },
    },
  },
}
