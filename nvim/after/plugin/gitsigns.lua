local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    return
end

local directoryExists = require("diego.lua-functions").directoryExists
local isGitRepository = directoryExists(".git")

if not isGitRepository then
    return
end

gitsigns.setup {
    signcolumn = false,
    on_attach = function(bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gitsigns.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, 'gs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>gS', gitsigns.stage_buffer)
        map('n', '<leader>gu', gitsigns.undo_stage_hunk)
        map('n', '<leader>gR', gitsigns.reset_buffer)
        map('n', '<leader>gp', gitsigns.preview_hunk)
        map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end)
        map('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>gtd', gitsigns.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
