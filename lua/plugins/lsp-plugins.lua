return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  {
    "williamboman/mason.nvim",
    priority = 500,
    opts = {
      PATH = "append",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    priority = 100,
  },
  { "neovim/nvim-lspconfig" },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {},
    init = function(_)
      vim.diagnostic.config({ virtual_text = false })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
