vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load neo-tree/telescope if dir is not a file
local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
            -- Vim creates a buffer for folder. Close it.
            vim.cmd(":bd 1")
            require("telescope.builtin").find_files({ search_dirs = { first_arg } })
            -- require("neo-tree.command").execute({ toggle = true })
        end
    end,
    group = ts_group,
})

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
