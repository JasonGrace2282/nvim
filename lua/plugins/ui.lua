return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        backend = "cmp", -- backend to use to show regular cmdline completions
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
      views = {
        notify = {
          level = vim.log.levels.INFO,
          replace = true,
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false,
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
      end,
    },
    init = function(_)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    init = function()
      vim.notify = require("notify")
    end,
  },
}
