vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load files
local paths = {
  "lazy",
  "opts",
  "autocmds",
  "keybinds"
}
for i=1, #paths do
  require('config.' .. paths[i])
end

vim.notify = require('notify')
