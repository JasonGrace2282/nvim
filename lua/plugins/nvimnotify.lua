return {
  'rcarriga/nvim-notify',
  -- enabled = false,
  init = function (notif)
    vim.notify = notif
  end
}
