local telescope = require('telescope.builtin')

local normal_keybinds = {
    {
      "<leader>ff",
      telescope.find_files,
      { desc="Search for file" }
    },
    {
      "<leader>fb",
      telescope.buffers,
      { desc="Open buffer list" }
    },
    {
      "<leader>st",
      telescope.live_grep,
      { desc="Nicer live-grep" }
    },
    {
      "<C-h>",
      "<C-w>h",
      { desc="Move rightwards along windows" }
    },
    {
      "<C-l>",
      "<C-w>l",
      { desc="Move leftwards along windows" }
    },
    {
      "<leader>rf",
      ":RunCode<CR>",
      { desc="Run Code" }
    },
    {
      "<C-K>",
      function ()
        local luasnip = require('luasnip')
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end,
      { desc="Expand snippet" }
    }
}

for i=1,#normal_keybinds do
  local binds = normal_keybinds[i]
  vim.keymap.set("n", binds[1], binds[2], binds[3])
end


