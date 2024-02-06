vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load files
local paths = {
  "lazy",
  "opts",
  "autocmds",
  "keybinds"
}
for _, path in ipairs(paths) do
  require('config.' .. path)
end

vim.notify = require('notify')
