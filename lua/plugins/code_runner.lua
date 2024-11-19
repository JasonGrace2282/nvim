return {
  "CRAG666/code_runner.nvim",
  lazy = true,
  opts = {
    filetype = {
      java = {
        'cd "$dir";',
        'javac "$fileName" &&',
        'java "$fileNameWithoutExt"',
      },
      python = "python",
      rust = { "cargo run" },
    },
    project = pcall(require, "config.projects") and require("config.projects") or {},
  },
  keys = {
    {
      "<leader>rf",
      ":RunCode<CR>",
      { desc = "Run Code" },
    },
  },
}
