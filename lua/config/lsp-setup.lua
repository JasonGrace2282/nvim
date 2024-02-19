vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local nmap = function (bind, cmd, desc) vim.keymap.set('n', bind, cmd, { buffer = event.buf, desc = desc }) end

    nmap('K', vim.lsp.buf.hover, "VS Code-like hovering")
    nmap('gd', ':Telescope lsp_definitions', "Definition of word")
    nmap('gi', ':Telescope lsp_implementation', "See implementation")
    nmap('go', ':Telescope lsp_type_definition', "See definition of type (C-like languages)")
    nmap('gr', ':Telescope lsp_references', "See references")
    nmap('gK', ':Telescope lsp_signature_help', "See signature")
    nmap('<leader>rn', ':Telescope lsp_rename', "Rename something")
    nmap('<leader>cf', ':Telescope lsp_format({async = true})', "Format the file")
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "ruff_lsp",
    "pylsp"
  },
  handlers = {
    default_setup,
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'path'},
    {name = 'buffer'},
    {name = 'nvim_lua'},
    {name = 'cmdline'}
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-y>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
