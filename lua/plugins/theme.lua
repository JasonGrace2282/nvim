return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      transparent = false,
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
      end,
    },
    config = function (_, opts)
      require('tokyonight').setup(opts)
      vim.cmd[[colorscheme tokyonight]]
    end
  }
