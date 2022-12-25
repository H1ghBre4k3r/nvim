local lsp = require('lsp-zero')
local snip_status_ok, luasnip = require("luasnip")
local lspkind = require("lspkind")

lsp.preset('recommended')

local cmp = require("cmp")

lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            fallback()
        end),
        ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end)
    }),
    preselect = cmp.PreselectMode.None,
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
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
})

lsp.setup()

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "",
    command = "lua vim.lsp.buf.format()"
})
