local function augroup(name)
  return vim.api.nvim_create_augroup("supervim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile','BufRead'}, {
  group = augroup('django_highlight'),
  pattern = {'*/templates/*.html'},
  callback = function ()
    vim.cmd[[set filetype=htmldjango]]
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile','BufRead'}, {
  group = augroup('lang'),
  pattern = {'*.rs'},
  callback = function ()
    vim.lsp.inlay_hint.enable(true, { buffer=0 })
  end,
})


-- load telescope on startup if dir is a folder
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


vim.api.nvim_set_hl(0, '@string.documentation.python', { link="String" })
vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference.rust', { undercurl=false })

-- Example custom highlighting

local function set_highlight_token(token, args, label)
  vim.lsp.semantic_tokens.highlight_token(
    token, args.buf, args.data.client_id, label
  )
end

-- local function py_set_by_text(args)
--   local token = args.data.token
--   if token.type ~= "parameter" then return end
--
--   local text = vim.api.nvim_buf_get_text(
--     args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]
--
--   if text ~= "self" and text ~= "cls" then return end
--
--   local label
--   if text == "self" then
--     label = "@python.self"
--   elseif text == "cls" then
--     label = "@python.cls"
--   end
--   set_highlight_token(token, args, label)
-- end

local function nicer_heighlight_undef(args)
  local token = args.data.token
  if token.type == "unresolvedReference" then
    -- I like this color
    set_highlight_token(token, args, "@lsp.type.interface")
  end
end

local function add_autocmds_by_fname(autocmds, ext)
  for _, callback in ipairs(autocmds) do
    vim.api.nvim_create_autocmd("LspTokenUpdate", {
      pattern = {"*." .. ext,},
      callback = callback,
    })
  end
end

add_autocmds_by_fname({nicer_heighlight_undef}, "rs")


-- FOLDS

vim.opt.foldopen:remove { "search" } -- no auto-open when searching, since the following snippet does that better

vim.keymap.set("n", "/", "zn/", { desc = "Search & Pause Folds" })

vim.on_key(function(char)
	local key = vim.fn.keytrans(char)
	local searchKeys = { "n", "N", "*", "#", "/", "?" }

	local searchConfirmed = (key == "<CR>" and vim.fn.getcmdtype():find("[/?]") ~= nil)
	if not (searchConfirmed or vim.fn.mode() == "n") then return end
	local searchKeyUsed = searchConfirmed or (vim.tbl_contains(searchKeys, key))
	local pauseFold = vim.opt.foldenable:get() and searchKeyUsed
	local unpauseFold = not (vim.opt.foldenable:get()) and not searchKeyUsed
	if pauseFold then
		vim.opt.foldenable = false
	elseif unpauseFold then
		vim.opt.foldenable = true
		vim.cmd.normal("zv") -- after closing folds, keep the *current* fold open
	end

end, vim.api.nvim_create_namespace("auto_pause_folds"))

-- remember folds across sessions
local function remember(mode)
	-- avoid complications with some special filetypes
	local ignoredFts = { "TelescopePrompt", "DressingSelect", "DressingInput", "toggleterm", "gitcommit", "replacer", "harpoon", "help", "qf" }
	if vim.tbl_contains(ignoredFts, vim.bo.filetype) or vim.bo.buftype ~= "" or not vim.bo.modifiable then return end

	if mode == "save" then
		vim.cmd[[mkview 1]]
	else
		pcall(function() vim.cmd[[loadview 1]] end) -- pcall, since new files have no view yet

	end

end

vim.api.nvim_create_autocmd("BufWinLeave", {

	pattern = "?*",

	callback = function() remember("save") end,

})

vim.api.nvim_create_autocmd("BufWinEnter", {

	pattern = "?*",

	callback = function() remember("load") end,

})
