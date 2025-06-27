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
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("django_highlight"),
  pattern = { "*/templates/*.html" },
  callback = function()
    vim.cmd([[set filetype=htmldjango]])
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("lang"),
  pattern = { "*.rs" },
  callback = function()
    vim.lsp.inlay_hint.enable(true, { buffer = 0 })
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

vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "String" })
vim.api.nvim_set_hl(0, "@lsp.type.unresolvedReference.rust", { undercurl = false })
vim.api.nvim_set_hl(0, "@module.python", { link = "@variable.python" })
vim.api.nvim_set_hl(0, "@lsp.type.selfParameter.python", { link = "@lsp.type.selfKeyword" })

-- Example custom highlighting

local function set_highlight_token(token, args, label)
  vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, label)
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
      pattern = { "*." .. ext },
      callback = callback,
    })
  end
end

add_autocmds_by_fname({ nicer_heighlight_undef }, "rs")
