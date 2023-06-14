local lsp_zero = require("lsp-zero")
local lspkind = require("lspkind")

lsp_zero.preset("recommended")

local cmp = require("cmp")

lsp_zero.setup_nvim_cmp({
	mapping = cmp.mapping.preset.insert({
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Esc>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	preselect = cmp.PreselectMode.None,
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Insert,
		select = false,
	},
	sources = {
		-- { name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = lspkind.cmp_format({
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "ﰠ",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "塞",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "פּ",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}) or nil,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- local navic = require("nvim-navic")
-- lsp_zero.on_attach(function(client, bufnr)
-- 	navic.attach(client, bufnr)
-- end)
lsp_zero.setup()

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	settings = {
		javascript = {
			preferences = {
				importModuleSpecifier = "absolute",
			},
		},
		typescript = {
			preferences = {
				importModuleSpecifier = "absolute",
			},
		},
	},
})
