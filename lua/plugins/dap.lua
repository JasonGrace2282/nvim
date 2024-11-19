return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- dap.adapters.codelldb = {
      --   type = "server",
      --   host = "127.0.0.1",
      --   port = 13000,
      --   executable = {
      --     command = "/home/jasongrace2282/.local/share/nvim/mason/bin/codelldb",
      --     args = { "--port", 13000 },
      --   },
      -- }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end)

      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end)

      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end)

      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
      )
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Search", linehl = "debugPC", numhl = "debugPC" })
      vim.keymap.set("n", "<leader>tb", "<CMD>DapToggleBreakpoint<CR>")

      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    priority = 100,
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
