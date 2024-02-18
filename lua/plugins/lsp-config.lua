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
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            local cmp = require('cmp')
            cmp.setup({
              sources = {
                {name = 'nvim_lsp'},
              },
              mapping = {
                ['<C-y>'] = cmp.mapping.confirm({select = false}),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                ['<C-p>'] = cmp.mapping(function()
                  if cmp.visible() then
                    cmp.select_prev_item({behavior = 'insert'})
                  else
                    cmp.complete()
                  end
                end),
                ['<C-n>'] = cmp.mapping(function()
                  if cmp.visible() then
                    cmp.select_next_item({behavior = 'insert'})
                  else
                    cmp.complete()
                  end
                end),
              },
              snippet = {
                expand = function(args)
                  require('luasnip').lsp_expand(args.body)
                end,
              },
            })
        end
    },
    {'L3MON4D3/LuaSnip'},
}
