-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd.packadd("packer.nvim")

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- Fancy UI popups
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
		})

		use({
			"arcticicestudio/nord-vim",
			config = function()
				vim.cmd.colorscheme("nord")
			end,
		})

		-- Fancy line at the bottom
		use({
			"vim-airline/vim-airline",
			config = function()
				vim.g.airline_theme = "nord"
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			{ run = ":TSUpdate" },
		})

		-- Terminal popup
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("toggleterm").setup()
			end,
		})

		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

		-- Git stuff
		use({
			"airblade/vim-gitgutter",
			"tpope/vim-fugitive",
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- LSP stuff
		use({
			"VonHeikemen/lsp-zero.nvim",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})

		use("onsails/lspkind.nvim")

		use("nvim-lua/lsp-status.nvim")

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim", "jayp0521/mason-null-ls.nvim" },
		})

		-- Comments all the way down
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- Cool file explorer
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			end,
		})
		use({ "stevearc/dressing.nvim" })
		use("andweeb/presence.nvim")
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
