vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load telescope if dir is a folder
local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
            -- Vim creates a buffer for folder. Close it.
            vim.cmd(":bd 1")
            require("telescope.builtin").find_files({ search_dirs = { first_arg } })
        end
    end,
    group = ts_group,
})

-- load paths in lua/config
local paths = {
  "lazy",
  "opts",
  "autocmds",
  "keybinds",
  "autopairs"
}
for _, path in ipairs(paths) do
  require('config.' .. path)
end

-- if nvim-notify is enabled use it
if pcall(require, 'notify') then
  vim.notify = require('notify')
end
