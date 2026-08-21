-- Theme plugins
local function trans_background()
  if vim.g.neovide then
    return false
  else
    return true
  end
end

return {
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
    version = 'v1.11.0',
    config = function()
      require('catppuccin').setup {
        transparent_background = trans_background(),
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
            inlay_hints = {
              background = true,
            },
          },
          navic = { enabled = true, custom_bg = 'lualine' },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
        custom_highlights = function(_colors)
          return {
            -- CmpDocNormal = { bg = '#414559' },
            -- NormalFloat = { bg = '#414559' },
          }
        end,
      }
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
  {
    src = 'https://github.com/folke/tokyonight.nvim',
  },
}
