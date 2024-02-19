local silents = {
  {
    "u",
    ":silent undo<CR>",
    { desc = "Undo without notification" }
  },
  {
    "<C-r>",
    ":silent redo<CR>",
    { desc = "Redo without notification" }
  },
  {
    "y",
    ":silent yank<CR>",
    { desc = "yank without notification" }
  },
  {
    "p",
    ":silent put<CR>",
    { desc = "paste without notification" }
  },
}

local rebinds = {

}

-- Remap u, y, p and <C-r> to be their silent versions
local silent = false
if silent then
  for _, bind in ipairs(silents) do
    rebinds[#rebinds+1] = bind
  end
end

for _, binds in ipairs(rebinds) do
  vim.keymap.set('n', binds[1], binds[2], binds[3])
end

