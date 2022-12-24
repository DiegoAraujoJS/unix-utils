local status, lualine = pcall(require, "lualine")
if status then
    lualine.setup {
        options = {
            icons_enabled = false,
            theme = "onedark",
            component_separators = "|",
            section_separators = '',
        },
    }
end
