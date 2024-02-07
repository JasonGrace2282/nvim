return {
    {
        "williamboman/mason.nvim",
        priority=500,
        -- this is needed for some reason
        -- all the real opts are in callafter.lua
        opts = {}
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        priority = 200,
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        priority=100,
        opts = {}
    },
    { "neovim/nvim-lspconfig" },
    {
      'hrsh7th/cmp-nvim-lsp',
      event = { "InsertEnter", "CmdlineEnter" }
    },
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
}
