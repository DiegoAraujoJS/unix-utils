local function invertWrap()
    local wrap_state = true
    return function()
        wrap_state = not wrap_state
        print("Wrap lines", "-->", tostring(wrap_state))
        vim.opt.wrap = wrap_state
    end
end

local function inlineDiagnostics()
    local virtual_text_state = false
    return function()
        virtual_text_state = not virtual_text_state
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = virtual_text_state
        })
        print("Inline diagnostics", "-->", tostring(virtual_text_state))
    end
end

local function extractRelativeFilePath()
    local path = vim.fn.expand('%')
    print(path)
    vim.fn.setreg('+', path)
end

local function extractPhysicalFilePath()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg("+", path)
end

local function extractFileNameNoExtension()
    local name = vim.fn.expand('%:t')
    vim.fn.setreg("+", string.match(name, "[^.]*"))
end

_G.InvertWrap = invertWrap()
_G.InlineDiagnostics = inlineDiagnostics()
_G.extractRelativeFilePath = extractRelativeFilePath
_G.extractPhysicalFilePath = extractPhysicalFilePath
_G.extractFileNameNoExtension = extractFileNameNoExtension
