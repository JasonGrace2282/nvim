-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set('n', '<C-CR>', ':terminal<CR>')
vim.keymap.del("n", "]b", {})
vim.keymap.del("n", "[b", {})

-- disable arrow keymaps
local keys = {
  "<UP>",
  "<Left>",
  "<Right>",
  "<Down>"
}
for i = 1, #keys, 1 do
  vim.keymap.set("n", keys[i], "")
end


vim.keymap.set("n", "<Leader>rf", ":RunFile<CR>")
vim.keymap.set("n", "<Leader>vc", ":VimtexCompile<CR>")

vim.keymap.set('n', '<Leader>d', '"_d')
