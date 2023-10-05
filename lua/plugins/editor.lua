-- My customizations of https://www.lazyvim.org/plugins/editor
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy  = "vertical",
        layout_config    = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend         = 20,
      },
    },
    keys = {
      -- disable the default keymaps
      { "<leader>,",  false },
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
      { "<lea der>bb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- helps
      { '<lea der>h"', "<cmd>Telescope registers<cr>",                     desc = "Registers" },
      { "<lea der>ha", "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
      { "<lea der>hc", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      { "<lea der>hC", "<cmd>Telescope commands<cr>",                      desc = "Commands" },
      { "<lea der>hd", "<cmd>Telescope diagnostics bufnr=0<cr>",           desc = "Document diagnostics" },
      { "<lea der>hD", "<cmd>Telescope diagnostics<cr>",                   desc = "Workspace diagnostics" },
      { "<lea der>hh", "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
      { "<lea der>hH", "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
      { "<lea der>hk", "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
      { "<lea der>hm", "<cmd>Telescope man_pages<cr>",                     desc = "Man Pages" },
      { "<lea der>ho", "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
      { "<lea der>hR", "<cmd>Telescope resume<cr>",                        desc = "Resume" },
      { "<lea der>hP", function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end, desc = "Find Plugin File" },
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
        ["ga"]         = { name = "+Align" },
        ["gs"]         = { name = "+Surround" },
        ["<leader>h"]  = { name = "+help" },
        ["<leader>w"]  = { name = "+window" },
        ["<leader>ug"] = { name = "+Gitsigns" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ugb", "<cmd>Gitsigns toggle_current_line_blame<cr>",                        desc = "Toggle line blame" },
      { "<leader>ugg", "<cmd>Gitsigns toggle_word_diff<cr><cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle diff" },
      { "<leader>ugn", "<cmd>Gitsigns toggle_numhl<cr>",                                     desc = "Toggle number highlight" },
      { "<leader>ugl", "<cmd>Gitsigns toggle_linehl<cr>",                                    desc = "Toggle line highlight" },
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
    version      = "*",
    event        = "VeryLazy",
    dependencies = {
      'smoka7/hydra.nvim',
    },
    opts = {},
    cmd  = { 'mcstart', 'mcvisual', 'mcclear', 'mcpattern', 'mcvisualpattern', 'mcundercursor' },
    keys = {
      { mode = { "n", "v"}, "<c-n>", "<cmd>MCstart<cr>", desc = "Multicursor Start" },
    },
  },
  {
    "Vonr/align.nvim",
    event  = "VeryLazy",
    config = function()
      -- Refer to https://github.com/Vonr/align.nvim
      local a = require('align')

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { noremap = true, silent = true, desc = desc })
      end

      map('x', 'gaa', function() a.align_to_char(1, true)             end, "Align to a character")   -- Aligns to 1 character, looking left
      map('x', 'gas', function() a.align_to_char(2, true, true)       end, "Align to 2 characters")  -- Aligns to 2 characters, looking left and with previews
      map('x', 'gaw', function() a.align_to_string(false, true, true) end, "Align to a string")      -- Aligns to a string, looking left and with previews
      map('x', 'gar', function() a.align_to_string(true, true, true)  end, "Align to a lua pattern") -- Aligns to a Lua pattern, looking left and with previews

      -- Example gawip to align a paragraph to a string, looking left and with previews
      map(
        'n',
        'gaw',
        function()
          a.operator(
            a.align_to_string,
            { is_pattern = false, reverse = true, preview = true }
          )
        end,
        "Align to a string"
      )

      -- Example gaaip to aling a paragraph to 1 character, looking left
      map(
        'n',
        'gaa',
        function()
          a.operator(
            a.align_to_char,
            { length = 1, reverse = true }
          )
        end,
        "Align to a character"
      )
    end,
  },
}
