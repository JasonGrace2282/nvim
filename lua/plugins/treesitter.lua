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
    local parsers = require('nvim-treesitter.parsers')

    -- wgsl highlighting
    local parser_config = parsers.get_parser_configs()
    parser_config["wgsl"] = {
      install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
      },
    }

    -- mdx highlighting
    vim.filetype.add({
      extension = {
        mdx = 'mdx'
      }
    })
    local ft_to_parser = parsers.filetype_to_parsername
    ft_to_parser.mdx = "markdown"
  end
}
