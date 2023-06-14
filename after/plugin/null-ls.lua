local mason_null_ls = require("mason-null-ls")

local lsp_status = require("lsp-status")

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"gofmt",
		"rustfmt",
		"clang_format",
	},
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- on_attach = null_opts.on_attach,
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.gofmt,
		formatting.rustfmt,
		formatting.clang_format,
		-- diagnostics.eslint,
	},
	on_attach = function(current_client, bufnr)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end)
		vim.keymap.set("v", "<leader>la", function()
			vim.lsp.buf.code_action()
		end)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end)

		-- if capabilities.renameProvider then
		vim.keymap.set("n", "<leader>lr", function()
			vim.lsp.buf.rename()
		end)
		-- end
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
		lsp_status.on_attach(current_client)
	end,
})
