return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  lazy = false, -- This plugin is already lazy
  config = function ()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function (client, buf)
          local nmap = function (bind, cmd, desc)
            vim.keymap.set('n', bind, cmd, { desc = desc, silent=true, buffer=buf })
          end

          local lspmap = function (bind, cmd, desc)
            nmap(bind, function () vim.cmd.RustLsp(cmd) end, desc)
          end

          lspmap("<leader>rj", 'joinLines', "Join multiple lines into one smartly")
          lspmap("<leader>ro", 'openCargo', "Open Cargo.toml")
          lspmap("<leader>od", "openDocs", "Open docs.rs for the token")
          lspmap("<leader>M", "expandMacro", "Expand a macro")
          lspmap("<leader>m", "rebuildProcMacro", "Rebuild a macro")
          lspmap("<leader>ca", "codeAction", "rust_analyzer features")
          lspmap("<leader>rd", "renderDiagnostic", "Nicer feedback from trouble.nvim")
          lspmap("<leader>i", { 'moveItem', 'up' }, "Move line up one")
          lspmap("<leader>u", { 'moveItem', 'down' }, "Move line down one")

          nmap("<leader>rp", vim.cmd.RustFmt, "Format file")
        end
      }
    }
  end
}
