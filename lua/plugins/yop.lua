return {
  "zdcthomas/yop.nvim",
  lazy = false,
  opts = {
    {
      -- tf" to replace everything excluding "
      {"n", "v"},
      "t",
      function (lines)
        local line = string.gsub(lines[#lines], '^%s*(.-)%s*$', '%1')
        local result = line[#line]
        if result == nil then
          result = "\""
        end
        return { result }
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
