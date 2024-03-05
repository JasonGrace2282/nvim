return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>xx",
      ":TroubleToggle<CR>",
      { desc = "Toggle trouble.nvim" }
    }
  },
  config = function (_, opts)
    require("trouble").setup(opts)
  end
}
