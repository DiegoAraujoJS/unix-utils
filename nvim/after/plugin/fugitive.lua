local directoryExists = require("diego.lua-functions").directoryExists

local isGitRepository = directoryExists(".git")

if isGitRepository then
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    vim.keymap.set("n", '<leader>gl', "<cmd>Git log --all -n 50<CR>", {})
    vim.keymap.set("n", "<leader>gs", "<cmd>Git status<CR>", {})
    vim.keymap.set("n", "<leader>gd", "<cmd>Git diff HEAD<CR>", {})
    vim.keymap.set("n", "<leader>gca", "<cmd>Git commit --amend<CR>", {})
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", {})
    vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<CR>", {})
end
