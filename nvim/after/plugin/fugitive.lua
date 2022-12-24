local directoryExists = require("diego.lua-functions").directoryExists

local isGitRepository = directoryExists(".git")

if isGitRepository then
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    vim.keymap.set("n", '<leader>glg', "<cmd>Git log<CR>", {})
end
