local lsp = require("lsp-zero")
local lspkind = require("lspkind")

lsp.preset("recommended")

local cmp = require("cmp")

lsp.setup_nvim_cmp({
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
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp", keyword_length = 3 },
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

local lsp_status = require("lsp-status")

local navic = require("nvim-navic")
lsp.on_attach(function(client, bufnr)
	local capabilities = client.server_capabilities

	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end)
	vim.keymap.set("v", "<leader>la", function()
		vim.lsp.buf.code_action()
	end)
	vim.keymap.set("n", "<leader>gD", function()
		vim.lsp.buf.declaration()
	end)

	-- if capabilities.renameProvider then
	vim.keymap.set("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end)
	-- end

	lsp_status.on_attach(client)
	navic.attach(client, bufnr)
end)

lsp.setup()

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
