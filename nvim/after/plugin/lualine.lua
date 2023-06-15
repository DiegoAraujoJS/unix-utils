local status, lualine = pcall(require, "lualine")
if not status then
    return nil
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "vscode",
        component_separators = "|",
        section_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
