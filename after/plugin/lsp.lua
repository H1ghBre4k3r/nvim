local lsp = require('lsp-zero')
local lspkind = require("lspkind")

local border_opts =
{ border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None" }

lsp.preset('recommended')

local cmp = require("cmp")

lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     fallback()
        -- end),
        ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    preselect = cmp.PreselectMode.None,
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
    },
    completion = {
        keyword_length = 1,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
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
            TypeParameter = ""
        }) or nil,
    },
    window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
    },
})

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

    if capabilities.renameProvider then
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end)
    end
    -- local opts = { buffer = bufnr, remap = false }
    -- if client.name == "eslint" then
    --     vim.cmd.LspStop('eslint')
    --     return
    -- end
    --
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    -- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)
lsp.setup()

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "",
    command = "lua vim.lsp.buf.format()"
})
