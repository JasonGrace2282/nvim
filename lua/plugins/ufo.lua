return {
  "kevinhwang91/nvim-ufo",
  lazy = false,
  opts = {
    provider_selector = function()
        return {'lsp', 'indent'}
    end
  },
  init = function ()
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
  keys = {
    "zR",
    "zM",
  },
  dependencies = {
    'kevinhwang91/promise-async'
  },

  ---[[[
  --- CHEAT SHEET
  --- za -> collapse section
  --- zo -> uncollapse section
  ---]]]
}
