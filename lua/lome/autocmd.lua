vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})

-- open lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
    clear = true,
  }),
  callback = function()
    vim.hl.on_yank()
  end,
})
