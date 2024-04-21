local link_map = {
  ["@python.self"] = "@variable.builtin",
}

for link, target in pairs(link_map) do
  vim.api.nvim_set_hl(0, link, { link=target })
end
