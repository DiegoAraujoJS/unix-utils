local _, mason = pcall(require, 'mason')
if mason then
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end

local _, lualine = pcall(require, 'lualine')
if lualine then
    lualine.setup {}
end

