vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    use { "williamboman/mason.nvim" }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'hrsh7th/nvim-cmp'
    }
    use {
        "L3MON4D3/LuaSnip",
        tag = "v<CurrentMajor>.*",
        requires = { 'hrsh7th/cmp-nvim-lsp' }
    }
    use {
        "mbbill/undotree"
    }
    use {
        "tpope/vim-fugitive"
    }
end)
