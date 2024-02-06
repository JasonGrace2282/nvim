local file_utils = {}

--- This function finds the filename when given a complete path
---@param path string
---@return string
function file_utils:GetFilename(path)
    local filename = path:match("[^/\\]+$")
    if filename then
        return filename
    end
    error("Invalid path: " .. path)
end

--- Remove File Extension (remove everything up to the last dot)
---@param fname string
---@return string
function file_utils:RemoveFileExtension(fname)
    local base = fname:match("(.+)%..+$")
    return base or fname
end

---Get all files in a directory. The directory can contain regex. absolute means to return absolute paths (default false)
---@param dir_regex string
---@param absolute boolean
---@return table[string]
function file_utils:GetFilesInDir(dir_regex, absolute)
    absolute = absolute or false
    local paths = vim.split(vim.fn.glob(dir_regex), '\n')

    if not absolute then
        for i, path in ipairs(paths) do
            paths[i] = file_utils:GetFilename(path)
        end
    end
    return paths
end

return file_utils
