local function invertWrap()
    local wrap_state = true
    return function()
        wrap_state = not wrap_state
        vim.opt.wrap = wrap_state
    end
end

_G.InvertWrap = invertWrap()
