return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    style = 'moon',
    transparent = false,
    on_highlights = function(hl, c)
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
    end,
  },
  init = function (_)
    vim.cmd[[colorscheme tokyonight]]
  end
}
