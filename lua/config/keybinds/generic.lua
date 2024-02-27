local binds = {
  {
    "<leader>d",
    "\"_d",
    { desc = "Delete without copying" }
  }
}

for _, bind in ipairs(binds) do
  vim.keymap.set('n', bind[1], bind[2], bind[3])
end

