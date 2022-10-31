vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    use { "williamboman/mason.nvim" }
end)
