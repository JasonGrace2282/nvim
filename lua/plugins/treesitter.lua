return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "html",
      "markdown",
      "markdown_inline",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
