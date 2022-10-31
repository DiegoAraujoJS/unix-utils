require "diego.custom-functions"
local nnoremap = require("diego.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>wr", "<cmd>lua InvertWrap()<CR>") -- look at InvertWrap in diego.custom-functions
nnoremap("<leader>l", "<cmd>lua InlineDiagnostics() <CR>")
nnoremap("<leader>e", "<cmd>lua vim.diagnostic.open_float() <CR>")
