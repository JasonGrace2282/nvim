return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      'mfussenegger/nvim-dap'
    },
  },
  {
    -- like mason.nvim, opts are in lsp-setup
    "jay-babu/mason-nvim-dap.nvim",
    priority = 100,
    opts = {}
  }
}
