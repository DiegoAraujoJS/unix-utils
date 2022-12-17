require "diego.custom-functions"
local nnoremap = require("diego.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>wr", "<cmd>lua InvertWrap()<CR>") -- look at InvertWrap in diego.custom-functions
nnoremap("<leader>ll", "<cmd>lua InlineDiagnostics() <CR>")
nnoremap("<leader>e", "<cmd>lua vim.diagnostic.open_float() <CR>")

for _, key in pairs({ "h", "l", "j", "k", "r" }) do nnoremap("<Tab>" .. key, "<C-w>" .. key) end

nnoremap("<leader>[", "<cmd>vertical resize +5 <CR>")
nnoremap("<leader>]", "<cmd>vertical resize -5 <CR>")

--telescope
