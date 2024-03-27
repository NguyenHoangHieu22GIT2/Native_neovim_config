vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ "rose-pine/neovim", as = "rose-pine" ,config = function()
	  vim.cmd('colorscheme rose-pine')
  end})
  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use("mg979/vim-visual-multi")
  use("numToStr/Comment.nvim")
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/nvim-cmp")
  use("williamboman/mason-lspconfig.nvim")
  use("williamboman/mason.nvim")
  use("max397574/better-escape.nvim")
  use("nvimtools/none-ls.nvim")
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use("nvim-pack/nvim-spectre")
  use("akinsho/toggleterm.nvim")
end)
