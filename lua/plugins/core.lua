-- Core dependencies and utilities
return {
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
  },
  {
    src = 'https://github.com/stevearc/conform.nvim',
    config = function()
      require('conform').setup {
        notify_on_error = false,
        format_on_save = function(bufnr)
          local disable_filetypes = {
            -- c = true,
            -- cpp = true,
          }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = 'fallback',
            }
          end
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
        },
      }

      vim.keymap.set('', '<leader>bf', function()
        require('conform').format {
          async = true,
          lsp_format = 'fallback',
        }
      end, {
        desc = '[B]uffer [F]ormat',
      })
    end,
  },
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
  },
}
