vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local nmap = function (bind, cmd, desc) vim.keymap.set('n', bind, cmd, { buffer = event.buf, desc = desc }) end

    nmap('K', vim.lsp.buf.hover, "VS Code-like hovering")
    nmap('gd', ':Telescope lsp_definitions<CR>', "Definition of word")
    nmap('gi', ':Telescope lsp_implementation<CR>', "See implementation")
    nmap('go', ':Telescope lsp_type_definition<CR>', "See definition of type (C-like languages)")
    nmap('gr', ':Telescope lsp_references<CR>', "See references")
    nmap('gK', ':Telescope lsp_signature_help<CR>', "See signature")
    nmap('<leader>rn', ':Telescope lsp_rename<CR>', "Rename something")
    nmap('<leader>cf', ':Telescope lsp_format<CR>', "Format the file")
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-nvim-dap').setup({
  ensure_installed = {
    "python"
  },
  automatic_installation = true,
  handlers = {}
})
require('mason-lspconfig').setup({
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "pylsp",
    "bashls"
  },
  handlers = {
    default_setup,
  },
})

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({
  capabilities = lsp_capabilities,
  filetypes = { "rust" },
  root_dir = require('lspconfig.util').root_pattern("Cargo.toml"),
  settings = {
    [ "rust_analyzer" ] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
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
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'path'},
    {name = 'buffer'},
    {name = 'nvim_lua'}
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
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
