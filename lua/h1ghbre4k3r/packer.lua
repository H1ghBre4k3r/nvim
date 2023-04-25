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
			"kdheepak/lazygit.nvim",
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({ map_cr = true })
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
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "saadparwaiz1/cmp_luasnip" },

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

		-- more advanced syntax highlighting
		use({
			"nvim-treesitter/nvim-treesitter",
			{
				run = ":TSUpdate",
			},
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

		-- re-design standard vim ui
		use("stevearc/dressing.nvim")

		use("andweeb/presence.nvim")

		-- show current location in winbar
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})

		-- show nested location with line numbers in winbar
		-- use("wellle/context.vim")

		-- more advanced buffer deletion
		use("famiu/bufdelete.nvim")

		use({
			"H1ghBre4k3r/y-lang.nvim",
			config = function()
				require("y-lang")
			end,
		})

		use("simrat39/rust-tools.nvim")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
