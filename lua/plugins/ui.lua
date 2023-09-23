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
      { "<leader>;", '<Cmd>lua require("alpha").start() <CR>', desc = "Dashboard" },
    }
  },
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },
}
