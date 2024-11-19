local telescope = require("telescope.builtin")

local normal_keybinds = {
  {
    "<leader>ff",
    telescope.find_files,
    { desc = "Search for file" },
  },
  {
    "<leader>fb",
    telescope.buffers,
    { desc = "Open buffer list" },
  },
  {
    "<leader>st",
    telescope.live_grep,
    { desc = "Nicer live-grep" },
  },
  {
    "<leader>ud",
    function()
      vim.diagnostic.config({ virtual_text = true })
    end,
    { desc = "turn on inline errors" },
  },
  {
    "<leader>rd",
    function()
      vim.diagnostic.config({ virtual_text = false })
    end,
    { desc = "turn off inline errors" },
  },
  {
    "<C-h>",
    "<C-w>h",
    { desc = "Move rightwards along windows" },
  },
  {
    "<leader>w>",
    "20<C-w>>",
    { desc = "Resize window to the left" },
  },
  {
    "<leader>w<",
    "20<C-w><",
    { desc = "Resize window to the right" },
  },
  {
    "<leader>bd",
    ":bd<CR>",
    { desc = "Delete buffer" },
  },
  {
    "<C-Return>",
    require("betterTerm").open,
    { desc = "Open terminal in insert mode" },
  },
  {
    "<leader>d",
    '"_d',
    { desc = "Delete without copying" },
  },
  {
    "<C-p>",
    function()
      vim.cmd([[nohl]])
    end,
    { desc = "Clear highlighting" },
  },
  {
    "<leader>rp",
    function()
      vim.lsp.buf.format()
    end,
    { desc = "Format buffer" },
  },
}

for _, binds in ipairs(normal_keybinds) do
  local opts = binds[3]
  opts.silent = true
  vim.keymap.set("n", binds[1], binds[2], opts)
end

vim.keymap.set("t", "<C-space>", "<C-\\><C-n>", { silent = true, desc = "terminal normal mode" })
