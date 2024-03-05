return {
  "CRAG666/code_runner.nvim",
  lazy = true,
  opts = {
    filetype = {
      java = {
        "cd $dir;",
        "javac $fileName;",
        "java $fileNameWithoutExt"
      },
      python = "python",
      rust = {
        "cd $dir;",
        "rustc $fileName;",
        "$dir/$fileNameWithoutExt"
      }
    },
    project = require('config.projects')
  },
  keys = {
    {
      "<leader>rf",
      ":RunCode<CR>",
      { desc="Run Code" }
    },
  }
}
