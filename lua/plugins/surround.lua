return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  keys = {
    "cs",
    "ds"
  },
  config = function () -- needed to lazy load
    require('nvim-surround').setup()
  end
}
