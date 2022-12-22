-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use  {
	  'arcticicestudio/nord-vim',
	  config = function() 
 		vim.cmd.colorscheme('nord')
	  end 
  }

  use { 
	  'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'}
  }

  use {
	  "akinsho/toggleterm.nvim", 
	  tag = '*', 
	  config = function()
		  require("toggleterm").setup()
	  end
  }
end)
