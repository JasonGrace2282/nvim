local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
local lspconfig = require('lspconfig')
require("mason").setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"rust_analyzer"},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function ()
      lspconfig.lua_ls.setup({})
    end,
    rust_analyzer = function ()
      lspconfig.rust_analyzer.setup({})
    end
  },
})

