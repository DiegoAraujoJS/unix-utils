local sortAlphabetically = require("diego.iats.utils").sortAlphabetically

-- -- Replacers line by line

local double_quotes_pattern = "\"[^\"]*\""

local function replaceDoubleQuotes(line)
    local i, j = string.find(line, double_quotes_pattern)
    if i then
        local replace = string.sub(line, 1, i - 1) ..
            "'" .. string.sub(line, i + 1, j - 1) .. "'" .. string.sub(line, j + 1)
        return replaceDoubleQuotes(replace)
    end
    return line
end

-- --

local function sortAndReplaceUseStatements(use_statements, use_statements_line_numbers, lines)
    table.sort(use_statements, sortAlphabetically)

    local k = 1
    for _, value in pairs(use_statements) do
        lines[use_statements_line_numbers[k]] = value
        k = k + 1
    end
    return lines
end

local use_statement_matcher = '^use .*;'

local function extractAndReplaceLinesFromFile(file)

    local lines = {}
    local use_statements = {}
    local use_statements_line_numbers = {}
    for line in file.lines(file) do
        local no_double_quotes_line = replaceDoubleQuotes(line)
        table.insert(lines, no_double_quotes_line)

        if string.match(line, use_statement_matcher) then
            table.insert(use_statements, line)
            table.insert(use_statements_line_numbers, #lines)
        end
    end

    lines = sortAndReplaceUseStatements(use_statements, use_statements_line_numbers, lines)

    return lines
end

local function readTextFile(path)
    local text = io.open(path, "r")
    if text == nil then
        return false
    end

    local lines = extractAndReplaceLinesFromFile(text)
    text.close(text)
    return lines
end

local function IatsPrettier()
    local path = vim.fn.expand('%')
    if not string.match(path, ".php") then
        print("not a php file")
        return
    end
    local lines = readTextFile(path)
    local file = io.open(path, "w+")
    if file == nil or not lines then
        return false
    end
    local text = ""
    for _, v in pairs(lines) do
        text = text .. v .. "\n"
    end
    file.write(file, text)
    file.close(file)
    vim.cmd("e")
end

_G.IatsPrettier = IatsPrettier
