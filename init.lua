vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
  return
end

-- load paths in lua/config
local paths = {
  "opts",
  "lazy",
  "autocmds",
  "keybinds"
}
for _, path in ipairs(paths) do
  require('config.' .. path)
end
