return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>xx",
      ":Trouble diagnostics toggle<CR>",
      { desc = "Toggle trouble.nvim" },
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
  config = function(_, opts)
    require("trouble").setup(opts)
  end,
}
