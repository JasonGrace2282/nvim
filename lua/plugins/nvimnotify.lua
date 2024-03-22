return {
  'rcarriga/nvim-notify',
  -- enabled = false,
  init = function ()
    vim.notify = require('notify')
  end
}
