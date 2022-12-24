local directoryExists = require("diego.lua-functions").directoryExists

local status, builtin = pcall(require, 'telescope.builtin')
if status then

    local keymap = {
        ['<leader>ff'] = builtin.find_files,
        ['<leader>fg'] = builtin.live_grep,
        ['<leader>fb'] = builtin.buffers,
        ['<leader>fh'] = builtin.help_tags,
        ['<leader>fy'] = builtin.command_history,
    }

    for key, value in pairs(keymap) do
        vim.keymap.set("n", key, value, {})
    end

    local isGitRepository = directoryExists(".git")

    if isGitRepository then
        vim.keymap.set("n", '<leader>fs', builtin.git_status, {})
        vim.keymap.set("n", '<leader>fc', builtin.git_commits, {})

    end

end
