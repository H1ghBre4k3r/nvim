return {
  -- {
  --   "hrsh7th/nvim-cmp",
  --   -- commit = "7e348da6e5085ac447144a2ef4b637220ba27209",
  --   -- version = false, -- last release is way too old
  --   -- event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     return {
  --       window = {
  --         completion = {
  --           border = "rounded",
  --         },
  --         documentation = {
  --           winhighlight = "Normal:CmpDocNormal",
  --           border = "double",
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },
    },
  },
}
