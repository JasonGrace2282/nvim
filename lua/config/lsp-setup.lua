vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local nmap = function (bind, cmd, desc) vim.keymap.set('n', bind, cmd, { buffer = event.buf, desc = desc, silent=true }) end

    nmap('K', vim.lsp.buf.hover, "VS Code-like hovering")
    nmap('gd', ':Telescope lsp_definitions<CR>', "Definition of word")
    nmap('gi', ':Telescope lsp_implementation<CR>', "See implementation")
    nmap('go', ':Telescope lsp_type_definition<CR>', "See definition of type (C-like languages)")
    nmap('gr', ':Telescope lsp_references<CR>', "See references")
    nmap('gK', ':Telescope lsp_signature_help<CR>', "See signature")
    nmap('<leader>rn', ':Telescope lsp_rename<CR>', "Rename something")
    nmap('<leader>cf', vim.lsp.buf.format, "Format the file")
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

local use_based_pyright = true
local ensure_installed = {
  "rust_analyzer",
  "lua_ls",
  "bashls"
}

if use_based_pyright then
  ensure_installed[#ensure_installed+1] = "basedpyright"
else
  ensure_installed[#ensure_installed+1] = "pyright"
end

require("java").setup({})
require('mason-lspconfig').setup({
  ensure_installed = ensure_installed,
  handlers = {
    default_setup,
    ["rust_analyzer"] = function ()
      -- do nothing, rustacean handles this
    end,
    ["basedpyright"] = function ()
      local lspconfig = require('lspconfig')

      lspconfig.basedpyright.setup({
        capabilities = lsp_capabilities,
        settings = {
          basedpyright = {
            -- No overly opinionated errors
            typeCheckingMode = "standard",
          },
        },
      })
    end
  },
})


--   פּ ﯟ   some other good icons
local kind_icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
  Copilot = " ",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'copilot'},
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'lazydev'},
    {name = 'path'},
    {name = 'buffer'},
    {name = 'nvim_lua'},
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item({behavior = 'select'}),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP ]",
        luasnip = "[Snip ]",
        buffer = "[Buf ]",
        path = "[Path ]",
        copilot = "[Copilot ]",
        nvim_lua = "[Lua ]",
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
