vim.g["airline#extensions#nvimlsp#enabled"] = 0

vim.fn["airline#parts#define_function"]("lsp_status", "LspStatus")
vim.g.airline_section_warning = vim.fn["airline#section#create_right"]({ "lsp_status" })
