local nnoremap = require("diego.keymap").nnoremap

nnoremap('<leader>cc', '<cmd>lua extractCommonActionReference()<CR>')

vim.api.nvim_create_user_command('IatsPrettier', 'lua IatsPrettier()', {})
