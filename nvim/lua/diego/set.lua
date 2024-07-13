local tablength = 2
vim.opt.tabstop = tablength
vim.opt.softtabstop = tablength
vim.opt.shiftwidth = tablength

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.completeopt = "menu,noinsert,noselect"

vim.g.mapleader = " "

vim.opt.updatetime = 300

vim.o.termguicolors = true


vim.opt.filetype = "on"
-- language specific configurations
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end
})

vim.g.vimtex_compiler_method = 'tectonic'
