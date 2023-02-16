local directoryExists = require("diego.lua-functions").directoryExists

local isGitRepository = directoryExists(".git")

if isGitRepository then
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    vim.keymap.set("n", '<leader>gl', "<cmd>Git log -n 50<CR>", {})
    vim.keymap.set("n", "<leader>gd", "<cmd>Git diff HEAD %<CR>", {})
    vim.keymap.set("n", "<leader>gD", "<cmd>Git diff HEAD<CR>", {})
    vim.keymap.set("n", "<leader>gA", "<cmd>Git add -A<CR>", {})
    vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", {})
    vim.keymap.set("n", "<leader>gC", "<cmd>Git commit<CR>", {})
    vim.keymap.set("n", "<leader>gta", "<cmd>Git stash push %<CR>", {})
    vim.keymap.set("n", "<leader>gtA", "<cmd>Git stash<CR>", {})
    vim.keymap.set("n", "<leader>gtp", "<cmd>Git stash pop<CR>", {})
    vim.keymap.set("n", "<leader>gtc", "<cmd>Git stash clear<CR>", {})
end
