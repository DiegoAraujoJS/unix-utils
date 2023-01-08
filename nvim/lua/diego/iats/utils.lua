local M = {}
local function sortAlphabetically(a, b, j)
    if string.len(string.sub(b, j or 1, j or 1)) == 0 then
        return false
    end
    if string.len(string.sub(a, j or 1, j or 1)) == 0 then
        return true
    end
    if string.byte(a, j or 1, (j or 1) + 1) > string.byte(b, j or 1, (j or 1) + 1) then
        return false
    elseif string.byte(a, j or 1, (j or 1) + 1) < string.byte(b, j or 1, (j or 1) + 1) then
        return true
    else
        return sortAlphabetically(a, b, (j or 1) + 1)
    end

end

M.sortAlphabetically = sortAlphabetically

return M
