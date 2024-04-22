local link_map = {
  ["@python.self"] = "@variable.builtin",
  ["@python.cls"] = "@variable.builtin",
  ["@python.callable"] = "@constructor",
  ["@python.decorator"] = "PreProc",
}

for link, target in pairs(link_map) do
  vim.api.nvim_set_hl(0, link, { link=target })
end
