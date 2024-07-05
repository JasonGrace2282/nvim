return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "wgsl" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function (_, opts)
    require('nvim-treesitter.configs').setup(opts)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config["wgsl"] = {
      install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
      },
    }
  end
}
