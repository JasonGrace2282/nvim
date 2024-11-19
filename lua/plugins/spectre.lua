return {
  "nvim-pack/nvim-spectre",
  keys = {
    "<space>sr",
  },
  opts = {
    mappings = {
      ["tab"] = {
        map = "<Tab>",
        cmd = "<cmd>lua require('spectre').tab()<cr>",
        desc = "next query",
      },
      ["shift-tab"] = {
        map = "<S-Tab>",
        cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
        desc = "previous query",
      },
      ["run_current_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line",
      },
      ["replace_cmd"] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace command",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.keymap.set("n", "<leader>sr", function()
      require("spectre").open()
    end, { desc = "Open nvim-spectre" })
  end,
}
