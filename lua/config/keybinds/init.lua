local utils = require("utils")
local paths = utils:GetFilesInDir(vim.fn.stdpath("config") .. "/lua/config/keybinds/*.lua", false)

for _, path in ipairs(paths) do
  local fname = utils:RemoveFileExtension(path)

  if fname ~= "init" then
    require("config.keybinds." .. fname)
  end
end
