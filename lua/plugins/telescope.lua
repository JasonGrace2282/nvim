return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  priority = 100,
  opts = {
    defaults = {
      file_ignore_patterns = {
        ".*.min.*",
        ".*vendor/",
        ".*node_modules/",
        ".*/game\\.js"
      }
    }
  }
}
