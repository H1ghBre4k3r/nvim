vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode',
})

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {
  desc = 'Move focus to the left window',
})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {
  desc = 'Move focus to the right window',
})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {
  desc = 'Move focus to the lower window',
})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {
  desc = 'Move focus to the upper window',
})

vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- toggle term configuration
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

-- cycle through buffers
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>')
--
-- fancy navigation through a file
vim.keymap.set('n', '<C-d>', [[<C-d>zz]])
vim.keymap.set('n', '<C-u>', [[<C-u>zz]])
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>c', function()
  require('bufdelete').bufdelete(0, false)
end)
vim.keymap.set('n', '<leader>C', function()
  require('bufdelete').bufdelete(0, false)
end, {
  desc = 'Close Buffer',
})

-- open lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')
