return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          -- highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
