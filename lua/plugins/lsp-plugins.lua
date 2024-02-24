return {
    {
        "folke/neodev.nvim",
        priority=700,
        opts = {}
    },
    {
        "williamboman/mason.nvim",
        priority=500,
        -- this is needed for some reason
        -- all the real opts are in config/lsp-setup.lua
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        priority=100,
        opts = {}
    },
    { "neovim/nvim-lspconfig" },
    {
      'hrsh7th/cmp-nvim-lsp',
      event = { "InsertEnter", "CmdlineEnter" },
      opts = {}
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-cmdline",
        },
        opts = {}
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
          require('luasnip.loaders.from_vscode').lazy_load()
        end
    },
}
