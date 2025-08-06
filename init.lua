--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.winborder = 'rounded'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 16

vim.o.confirm = true

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

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
    clear = true,
  }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.pack.add {
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },
  {
    src = 'https://github.com/NMAC427/guess-indent.nvim',
  }, -- Detect tabstop and shiftwidth automatically
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
  },
  {
    src = 'https://github.com/folke/which-key.nvim',
  },
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  },
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
  },
  {
    src = 'https://github.com/folke/lazydev.nvim',
  },
  {
    src = 'https://github.com/mason-org/mason.nvim',
  },
  {
    src = 'https://github.com/mason-org/mason-lspconfig.nvim',
  },
  {
    src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  {
    src = 'https://github.com/j-hui/fidget.nvim',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
  },
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
  },
  {
    src = 'https://github.com/stevearc/conform.nvim',
  },
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
  },
  {
    src = 'https://github.com/folke/tokyonight.nvim',
  },
  {
    src = 'https://github.com/folke/todo-comments.nvim',
  },
  {
    src = 'https://github.com/echasnovski/mini.nvim',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  },
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = 'v6.6.0' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
  { src = 'https://github.com/famiu/bufdelete.nvim' },
  { src = 'https://github.com/echasnovski/mini.tabline' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' },
  { src = 'https://github.com/numToStr/Comment.nvim' },
  { src = 'https://github.com/echasnovski/mini.notify' },
  { src = 'https://github.com/folke/noice.nvim' },
}
