return {
    {
        "williamboman/mason.nvim",
        priority=500,
        opts = {} -- needed for some reason?
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
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
}