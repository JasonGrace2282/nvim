return {
  "CRAG666/code_runner.nvim",
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
    project = {
      ["~/repos/learn/todo"] = {
        name = "todoApp",
        description = "A todo app in Rust",
        command = "cargo run"
      }
    }
  }
}
