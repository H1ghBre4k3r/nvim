-- File management plugins
return {
  {
    src = 'https://github.com/MunifTanjim/nui.nvim',
  },
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    config = function()
      require('neo-tree').setup {
        event_handlers = {
          {
            event = 'vim_buffer_enter',
            handler = function(_)
              if vim.bo.filetype == 'neo-tree' then
                vim.wo.signcolumn = 'auto'
              end
            end,
          },
        },
      }

      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle reveal<cr>')
      vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus reveal<cr>')
    end,
  },
  {
    src = 'https://github.com/famiu/bufdelete.nvim',
  },
}
