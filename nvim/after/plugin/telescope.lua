local directoryExists = require("diego.lua-functions").directoryExists

local status, telescope = pcall(require, 'telescope')
if not status then
  return nil
end

telescope.load_extension('emoji')

local status, builtin = pcall(require, 'telescope.builtin')
if not status then
  return nil
end

local keymap = {
  ['<leader>ff'] = builtin.find_files,
  ['<leader>fg'] = builtin.live_grep,
  ['<leader>fb'] = builtin.buffers,
  ['<leader>fh'] = builtin.help_tags,
  ['<leader>fl'] = builtin.resume,
  ['<leader>fe'] = builtin.diagnostics,
  ['<leader>fr'] = builtin.lsp_references,
  ['<leader>fk'] = builtin.keymaps
}

for key, value in pairs(keymap) do
  vim.keymap.set("n", key, value, {})
end

vim.keymap.set("n", '<leader>fd', require("diego.telescope").find_directories, {})

local isGitRepository = directoryExists(".git")

if isGitRepository then
  vim.keymap.set("n", '<leader>fs', builtin.git_status, {})
  vim.keymap.set("n", '<leader>fc', builtin.git_commits, {})
  vim.keymap.set("n", '<leader>fC', builtin.git_bcommits, {})
  vim.keymap.set("n", '<leader>fB', builtin.git_branches, {})
end
