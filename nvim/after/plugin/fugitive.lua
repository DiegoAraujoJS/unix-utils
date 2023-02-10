local directoryExists = require("diego.lua-functions").directoryExists

local isGitRepository = directoryExists(".git")

if isGitRepository then
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    vim.keymap.set("n", '<leader>gl', "<cmd>Git log -n 50<CR>", {})
    vim.keymap.set("n", "<leader>gss", "<cmd>Git status<CR>", {})
    vim.keymap.set("n", "<leader>gd", "<cmd>Git diff HEAD %<CR>", {})
    vim.keymap.set("n", "<leader>gD", "<cmd>Git diff HEAD<CR>", {})
    vim.keymap.set("n", "<leader>gca", ":Git add -A | Git commit<CR>", {})
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", {})
    vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<CR>", {})
    vim.keymap.set("n", "<leader>gA", "<cmd>Git add -A<CR>", {})
    vim.keymap.set("n", "<leader>gcc", "<cmd>Git commit<CR>", {})
    vim.keymap.set("n", "<leader>gsta", "<cmd>Git stash push %<CR>", {})
    vim.keymap.set("n", "<leader>gstA", "<cmd>Git stash<CR>", {})
    vim.keymap.set("n", "<leader>gstp", "<cmd>Git stash pop<CR>", {})
    vim.keymap.set("n", "<leader>gstc", "<cmd>Git stash clear<CR>", {})
end
