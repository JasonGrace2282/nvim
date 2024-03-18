return {
  "zdcthomas/yop.nvim",
  lazy = false,
  opts = {
    {
      -- tf" to replace everything excluding "
      {"n", "v"},
      "t",
      function (lines)
        local line = lines[#lines]:gsub('^%s*(.-)%s*$', '%1')
        return { line:sub(-1) }
      end
    }
  },
  config = function (_, opts)
    local yop = require('yop')
    for _, op in ipairs(opts) do
      yop.op_map(op[1], op[2], op[3])
    end
  end
}
