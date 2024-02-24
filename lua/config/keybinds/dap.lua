local debug_binds = {
  {
    '<leader>tb',
    require('dap').toggle_breakpoint,
    { desc = "[T]oggle a debugging [B]reakpoint" }
  },
  {
    '<leader>dc',
    require('dap').continue,
    { desc = "[D]ap [C]ontinue" }
  },
  {
    '<leader>so',
    require('dap').step_over,
    { desc = '[S]tep [O]ver code' }
  },
  {
    '<leader>si',
    require('dap').step_over,
    { desc = '[S]tep [I]nto code' }
  },
  {
    '<leader>ro',
    require('dap').repl.open,
    { desc = "View state" }
  }
}

for _, bind in ipairs(debug_binds) do
  vim.keymap.set('n', bind[1], bind[2], bind[3])
end

