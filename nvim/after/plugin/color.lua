local dark_green_comment = "#568203"
--------
-- tokyonight colorscheme
--------

-- local status, tokyonight = pcall(require, 'tokyonight')
-- if not status then
--     return nil
-- end


-- tokyonight.setup({
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--     light_style = "day", -- The theme is used when the background is set to light
--     transparent = false, -- Enable this to disable setting the background color
--     terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--     styles = {
--         -- Style to be applied to different syntax groups
--         -- Value is any valid attr-list value for `:help nvim_set_hl`
--         comments = { italic = true },
--         keywords = { italic = true },
--         functions = {},
--         variables = {},
--         -- Background styles. Can be "dark", "transparent" or "normal"
--         sidebars = "dark", -- style for sidebars, see below
--         floats = "dark", -- style for floating windows
--     },
--     sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--     day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--     hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--     dim_inactive = false, -- dims inactive windows
--     lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
--     --- You can override specific color groups to use other groups or a hex color
--     --- function will be called with a ColorScheme table
--     ---@param colors ColorScheme
--     on_colors = function(colors)
--         colors.comment = colors.cyan
--     end,
--
--     --- You can override specific highlights to use other groups or a hex color
--     --- function will be called with a Highlights and ColorScheme table
--     ---@param highlights Highlights
--     ---@param colors ColorScheme
--     on_highlights = function(highlights, colors) end,
-- })
--
-- vim.cmd("colorscheme tokyonight")

--------
-- tokyonight colorscheme
--------

--------
-- catppuccin colorscheme
--------

-- local status, catppuccin = pcall(require, 'catppuccin')
-- if not status then
--     return nil
-- end
--
-- catppuccin.setup {
--     flavour = "macchiato",
--     highlight_overrides = {
--         all = function(colors)
--             return {
--                 Comment = { fg = "#568203" },
--             }
--         end
--     },
-- }
--
-- vim.cmd("colorscheme catppuccin")

--------
-- catppuccin colorscheme
--------

--------
-- vscode colorscheme
--------

local ok, colors = pcall(require, 'vscode.colors')
if not ok then
    return
end
local c = colors.get_colors()

local ok, palette = pcall(require, 'catppuccin.palettes')
local catppuccin_base
if not ok then
    catppuccin_base = c.vscFront
else
    catppuccin_base = palette.get_palette('mocha').base
end

require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscBack = catppuccin_base,
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
})
require('vscode').load()

--------
-- vscode colorscheme
--------
