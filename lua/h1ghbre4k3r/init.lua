require("h1ghbre4k3r.packer")
require("h1ghbre4k3r.remap")

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.guifont = "MesloLGS Nerd Font Mono:h13"

-- Enable mouse mode
vim.o.mouse = 'a'
--
-- Enable break indent
-- vim.o.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
-- vim.o.smartindent = true

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
