-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("nvim-surround").setup() -- force keybinds on top

-- vim.g.vimtex_view_automatic = 0
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = 'zathura'
vim.o.shell = "/usr/bin/zsh"
vim.g.autoformat = false
-- vim.g.vimtex_view_automatic = false
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_forward_search_on_start = false

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- i3 syntax highlighting
autocmd({'BufNewFile','BufRead'}, {
  group = augroup('i3config_ft_detection', { clear = true } ),
  pattern = {'*/.config/i3*^.'},
  command = 'set filetype=i3config',
})

vim.g.vimtex_syntax_conceal = {
  accents= 0,
  ligatures = 1,
  cites = 1,
  fancy = 1,
  spacing = 0,
  greek = 0,
  math_bounds = 1,
  math_delimiters = 1,
  math_fracs = 1,
  math_super_sub = 1,
  math_symbols = 1,
  sections = 0,
  styles = 1,
}

-- Use :sp to split horizontally
-- :vs to split vertically
-- Ctrl-W + vim binds to navigate
