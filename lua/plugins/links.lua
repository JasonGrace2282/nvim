return {
  "sontungexpt/url-open",
  branch = "mini",
  event = "VeryLazy",
  opts = {
    open_only_when_cursor_on_url = true
  },
  keys = {
    '<leader>K'
  },
  config = function(_, opts)
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup(opts)
    vim.keymap.set('n', '<leader>K', '<cmd>URLOpenUnderCursor<CR>')
  end,
}
