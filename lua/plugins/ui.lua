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
  {
    "folke/edgy.nvim",
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { height = 0.4 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
          "Trouble",
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {
          {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            pinned = true,
            open = function()
              vim.api.nvim_input("<esc><space>e")
            end,
            size = { height = 0.5 },
          },
          { title = "Neotest Summary", ft = "neotest-summary" },
          {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
          },
          "neo-tree",
        },
        right = {},
        keys = {
          -- increase width
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }
      local Util = require("lazyvim.util")
      if Util.has("symbols-outline.nvim") then
        table.insert(opts.right, {
          title  = "Outline",
          ft     = "Outline",
          pinned = true,
          open   = "SymbolsOutline",
        })
      end
      return opts
    end
  },
}
