return {
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
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
