local mason_null_ls = require("mason-null-ls");

mason_null_ls.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "gofmt",
        "rustfmt"
    }
})

local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting;
local diagnostics = null_ls.builtins.diagnostics;

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    -- on_attach = null_opts.on_attach,
    sources = {
        formatting.prettier,
        formatting.stylua,
        formatting.gofmt,
        formatting.rustfmt
        -- diagnostics.eslint,
    },
    on_attach = function(current_client, bufnr)
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
    end,
})
