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
    'hrsh7th/cmp-nvim-lua'
  }
  use {
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    requires = { 'hrsh7th/cmp-nvim-lsp' }
  }
  use {
    'saadparwaiz1/cmp_luasnip'
  }
  use {
    "mbbill/undotree"
  }
  use {
    "tpope/vim-fugitive"
  }
  use {
    "nvim-lualine/lualine.nvim",
  }
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

  use {
    'onsails/lspkind.nvim'
  }
  use {
    'nvim-tree/nvim-web-devicons'
  }
  use {
    'romgrk/barbar.nvim',
    requires = 'nvim-web-devicons',
    disable = true
  }
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  use {
    'ziontee113/color-picker.nvim',
    config = function()
      require("color-picker")
    end,
  }
  use {
    'xiyaowong/telescope-emoji.nvim'
  }
  use {
    "catppuccin/nvim", as = "catppuccin"
  }
  use 'm4xshen/autoclose.nvim'
  use 'Mofiqul/vscode.nvim'
end)
