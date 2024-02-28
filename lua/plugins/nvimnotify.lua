return {
  'rcarriga/nvim-notify',
  enabled = false,
  config = function(_, opts)
    local notif = require('notify')
    notif.setup(opts)
    vim.notify = notif
  end
}
