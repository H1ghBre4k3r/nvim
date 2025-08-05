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

vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>')
