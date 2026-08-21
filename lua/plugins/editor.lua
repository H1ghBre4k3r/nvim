-- Editor enhancement plugins
return {
  {
    src = 'https://github.com/echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {
        n_lines = 500,
      }
      require('mini.surround').setup()
      require('mini.notify').setup()
      require('mini.indentscope').setup()
      require('mini.tabline').setup()
    end,
  },
  {
    src = 'https://github.com/windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  {
    src = 'https://github.com/numToStr/Comment.nvim',
    config = function()
      local comment = require 'Comment'
      comment.setup()

      vim.keymap.set('n', '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>")
      vim.keymap.set('v', '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
    end,
  },
  {
    src = 'https://github.com/NMAC427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  {
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          -- globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 1,
              symbols = {
                modified = '[+]',
                readonly = '[-]',
                unnamed = '[No Name]',
                newfile = '[New]',
              },
            },
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'neo-tree', 'nvim-tree', 'toggleterm' },
      }
    end,
  },
  {
    src = 'https://github.com/sphamba/smear-cursor.nvim',
    config = function()
      require('smear_cursor').setup {}
    end,
  },
}
