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

local function get_prop_names(args)
  local props = {}
  for j, propDefinition in ipairs(args[1]) do
    table.insert(props, propDefinition)
  end
  local propNames = {}
  for i, prop in ipairs(props) do
    local propName = vim.split(prop, ":")[1]
    local trimmedProp = string.gsub(propName, "%s+", "")
    table.insert(propNames, trimmedProp)
  end
  return table.concat(propNames, ", ")
end

M.get_prop_names = get_prop_names

return M
