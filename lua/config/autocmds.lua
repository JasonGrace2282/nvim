local function augroup(name)
  return vim.api.nvim_create_augroup("supervim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function py_set_by_text(args)
  local token = args.data.token
  if token.type ~= "parameter" then return end

  local text = vim.api.nvim_buf_get_text(
    args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]

  if text ~= "self" and text ~= "cls" then return end

  local label
  if text == "self" then
    label = "@python.self"
  elseif text == "cls" then
    label = "@python.cls"
  end
  vim.lsp.semantic_tokens.highlight_token(
    token, args.buf, args.data.client_id, label)
end

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  pattern = {"*.py",},
  callback = py_set_by_text,
})
