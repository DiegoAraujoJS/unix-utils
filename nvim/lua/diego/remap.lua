require "diego.custom-functions"
local nnoremap = require("diego.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>wr", "<cmd>lua InvertWrap()<CR>") -- look at InvertWrap in diego.custom-functions
nnoremap("<leader>ll", "<cmd>lua InlineDiagnostics() <CR>")
nnoremap("<leader>e", "<cmd>lua vim.diagnostic.open_float() <CR>")

for _, key in pairs({ "h", "l", "j", "k" }) do nnoremap("<Tab>" .. key, "<C-w>" .. key) end

--telescope
local status, builtin = pcall(require, 'telescope.builtin')
if status then
    nnoremap('<leader>ff', builtin.find_files)
    nnoremap('<leader>fg', builtin.live_grep)
    nnoremap('<leader>fb', builtin.buffers)
    nnoremap('<leader>fh', builtin.help_tags)
end
