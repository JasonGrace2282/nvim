return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  priority = 100,
  opts = {
    defaults = {
      mappings = {
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
      },
      file_ignore_patterns = {
        ".*.min.*",
        ".*vendor/",
        ".*node_modules/",
        ".*/game\\.js",
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzy_native")
  end,
}
