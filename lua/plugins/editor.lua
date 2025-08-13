-- Editor enhancement plugins
return {
  {
    src = 'https://github.com/echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {
        n_lines = 500,
      }
      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
      }

      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.notify').setup()
      require('mini.indentscope').setup()
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
}
