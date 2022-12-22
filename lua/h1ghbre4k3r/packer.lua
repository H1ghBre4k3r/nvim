-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd.packadd('packer.nvim')

return require('packer').startup({function(use)
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

  use {
	  'lewis6991/gitsigns.nvim',
	  tag = 'release', -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	  config = function()
		  require('gitsigns').setup {
			  signs = {
				  add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				  change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				  delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				  topdelete = {
					  hl = "GitSignsDelete",
					  text = "契",
					  numhl = "GitSignsDeleteNr",
					  linehl = "GitSignsDeleteLn",
				  },
				  changedelete = {
					  hl = "GitSignsChange",
					  text = "▎",
					  numhl = "GitSignsChangeNr",
					  linehl = "GitSignsChangeLn",
				  },
			  },
			  signcolumn = true,
			  numhl = false,
			  linehl = false,
			  word_diff = false,
			  watch_gitdir = {
				  interval = 1000,
				  follow_files = true,
			  },
			  attach_to_untracked = true,
			  current_line_blame = false,
			  current_line_blame_opts = {
				  virt_text = true,
				  virt_text_pos = "eol",
				  delay = 1000,
				  ignore_whitespace = false,
			  },
			  current_line_blame_formatter_opts = {
				  relative_time = false,
			  },
			  sign_priority = 6,
			  update_debounce = 100,
			  status_formatter = nil,
			  max_file_length = 40000,
			  preview_config = {
				  border = "single",
				  style = "minimal",
				  relative = "cursor",
				  row = 0,
				  col = 1,
			  },
			  yadm = {
				  enable = false,
			  },
		  }
	  end
  }

  use {
	  "windwp/nvim-autopairs",
	  config = function() 
		  require("nvim-autopairs").setup {} 
	  end
  }
end,
config = {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	}
}})
