-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.guifont = "MesloLGS Nerd Font Mono:h13"
vim.opt.cursorline = true

vim.opt.laststatus = 2

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable break indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.cindent = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- smartly split the windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- keep some padding while scrolling
vim.opt.scrolloff = 16
vim.opt.sidescrolloff = 8

-- Decrease update time
vim.o.updatetime = 100
vim.wo.signcolumn = "yes"

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- theme specific stuff
vim.g.neovide_transparency = 0.95
vim.g.nord_bold_vertical_split_line = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1

vim.g.airline_powerline_fonts = true

vim.opt.termguicolors = true
--
-- vim.api.nvim_command("filetype plugin indent off")
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufWrite" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufWrite" }, {
  pattern = "*.s",
  callback = function()
    vim.bo.filetype = "arm"
  end,
})
