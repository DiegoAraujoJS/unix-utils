local module_pattern = "module/[^/]*"
local subModule_pattern = "[^/]+"

local function extractCommonAction(path)
    local module = string.sub(string.match(path, module_pattern), string.len("module/") + 1)
    local i, j = string.find(path, "commonactions/")
    if not i then
        print("Not a common action")
        return nil
    end
    local result = ""
    local commonActionMatcher = string.gmatch(string.sub(path, j + 1), subModule_pattern)
    local match = commonActionMatcher()
    while match do
        result = result .. "." .. match
        match = commonActionMatcher()
    end
    return module .. string.sub(result, 1, string.len(result) - 3)
end

local function extractCommonActionReference()
    local path = vim.fn.expand('%')
    local reference = extractCommonAction(path)
    if reference then
        vim.fn.setreg('+', reference)
    end
end

_G.extractCommonActionReference = extractCommonActionReference
