local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

-- this somehow ignores the specified indent...
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "",
	command = "lua vim.lsp.buf.format()"
})
