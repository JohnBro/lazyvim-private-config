-- My customizations for https://www.lazyvim.org/plugins/coding
return {
  -- Add a nvim-cmp source
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      {
        "uga-rosa/cmp-dictionary",
        dependencies = {
          "Johnbro/dictionary.vim"
        },
        config = function()
          local dict     = require("cmp_dictionary")
          local dict_dir = join_paths(vim.fn.stdpath("data"), "lazy", "dictionary.vim", "dict")

          dict.switcher({
            filetype = {
              c          = join_paths(dict_dir, "c.dict"),
              cpp        = join_paths(dict_dir, "cpp.dict"),
              cmake      = join_paths(dict_dir, "cmake.dict"),
              html       = join_paths(dict_dir, "html.dict"),
              lua        = join_paths(dict_dir, "lua.dict"),
              latex      = join_paths(dict_dir, "latex.dict"),
              javascript = join_paths(dict_dir, "javascript.dict"),
              python     = join_paths(dict_dir, "python.dict"),
              sh         = join_paths(dict_dir, "sh.dict"),
              vim        = join_paths(dict_dir, "vim.dict")
            },
            filepath = {},
            spelllang = {
              en = join_paths(dict_dir, "oald_cn.dict"),
            },
          })
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "dictionary", keyword_length = 2 } }))
    end,
  },
  -- Suertab, refer to: https://www.lazyvim.org/configuration/recipes#supertab
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item({ select = true })
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd    = "SymbolsOutline",
    keys   = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  -- Change surround mappings
  {
    "echasnovski/mini.surround",
    version = "*",
  },
}
