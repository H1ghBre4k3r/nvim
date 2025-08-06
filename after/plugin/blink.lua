-- Configure completion (LuaSnip already added above)
-- Build LuaSnip regex support if make is available
if vim.fn.has 'win32' == 0 and vim.fn.executable 'make' == 1 then
  vim.fn.system('cd ' .. vim.fn.stdpath 'data' .. '/site/pack/*/start/LuaSnip && make install_jsregexp')
end

-- Configure blink.cmp
require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
    ['<C-y>'] = { 'select_and_accept' },
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = {
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },
  snippets = {
    preset = 'luasnip',
  },
  fuzzy = {
    implementation = 'lua',
  },
  signature = {
    enabled = true,
  },
}
