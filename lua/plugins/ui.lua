-- My UI customizations, refer to: https://www.lazyvim.org/plugins/ui

return {
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      -- logo
      local logo = {
        [[]],
        [[ ...      (^~^)                              ]],
        [[(°з°)  _ ┐__\|_┌________ __   __ ___ __   __ ]],
        [[|  |  | |       |       |  | |  |   |  |_|  |]],
        [[|   |_| |    ___|  ___  |  |_|  |   |       |]],
        [[|       |   |___| |▀-▀| |       |   |       |]],
        [[|  _    |    ___| |___| |       |   |       |]],
        [[| | |   |   |___|       ||     ||   | ||_|| |]],
        [[|_|  |__|_______|_______| |___| |___|_|   |_|]],
        [[]],
        [[]],
      }

      dashboard.section.header.val = logo
      dashboard.section.header.opts.position = "center"

      -- buttions
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
      { "<leader>D", '<Cmd>lua require("alpha").start() <CR>', desc = "Dashboard" },
    }
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>be", "<Cmd>BufferLinePickClose<CR>",       desc = "Pick Close" },
      { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>",       desc = "Close Left" },
      { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>",      desc = "Close Right" },
      { "<leader>bO", "<Cmd>BufferLineCloseOthers<CR>",     desc = "Close Others" },
      { "<leader>bn", "<Cmd>BufferLineCycleNext<CR>",       desc = "Next Buffer" },
      { "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>",       desc = "Previous Buffer" },
      { "<leader>bj", "<Cmd>BufferLinePick<CR>",            desc = "Jump Buffer" },
      { "<leader>bD", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort by Directory" },
      { "<leader>bL", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort by Language" },
      { "<leader>bt", "<Cmd>BufferLineTogglePin<CR>",       desc = "Toggle pin" },
      { "<leader>bT", "<Cmd>BufferLineGroupClose<CR>",      desc = "Delete non-pinned buffers" },
    },
  },
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },
}
