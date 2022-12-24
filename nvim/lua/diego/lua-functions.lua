local M = {}

local function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
local function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path .. "/")
end

M.directoryExists = isdir

return M
