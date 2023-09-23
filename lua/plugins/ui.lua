-- My UI customizations, refer to: https://www.lazyvim.org/plugins/ui
return {
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local buttons = {
        dashboard.button("C", " " .. " Command", "<CMD>Telescope commands <CR>"),
        dashboard.button("h", " " .. " Find Help", "<CMD>Telescope help_tags <CR>")
      }
      for _, button in ipairs(buttons) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      for _, button in ipairs(buttons) do
        table.insert(dashboard.section.buttons.val, #dashboard.section.buttons.val, button)
      end

      dashboard.section.buttons.opts.spacing = 0 -- Remove spacing
      table.insert(dashboard.opts.layout, #dashboard.opts.layout, { type = "padding", val = 1}) -- insert a padding above footer
    end,
    keys = {
      { "<leader>;", '<Cmd>lua require("alpha").start() <CR>', desc = "Dashboard" },
    }
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>be", "<Cmd>BufferLinePickClose<CR>", desc = "Pick buffer close" },
      { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close all left" },
      { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Close all right" },
      { "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<leader>bj", "<Cmd>BufferLinePick<CR>", desc = "Jump buffer" },
      { "<leader>bD", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
      { "<leader>bL", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort by language" },
    },
  },
}
