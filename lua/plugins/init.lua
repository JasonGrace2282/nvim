local utils = require('utils')
local paths = utils:GetFilesInDir(vim.fn.stdpath("config") .. '/lua/plugins/*.lua', false)
local plugins = {}

-- load every lua file in plugins dir
-- if it's a 2d table unpack it first
for _, path in ipairs(paths) do
  local fname = utils:RemoveFileExtension(path)

  if fname ~= "init" then
    local plug = require('plugins.' .. fname)

    if type(plug[0]) ~= "table" then
      plugins[#plugins + 1] = plug
    else
      for _, p in ipairs(plug) do
        plugins[#plugins + 1] = p
      end
    end
  end
end

return plugins
