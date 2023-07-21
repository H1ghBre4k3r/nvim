-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- toggle term configuration
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

-- diagnostics
vim.keymap.set("n", "<leader>lD", function()
  require("telescope.builtin").diagnostics()
end)
vim.keymap.set("n", "<leader>ld", function()
  vim.diagnostic.open_float()
end)

-- remove all highlights
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- create a new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>")

-- fancy navigation through a file
vim.keymap.set("n", "<C-d>", [[<C-d>zz]])
vim.keymap.set("n", "<C-u>", [[<C-u>zz]])
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- close currently open buffers
-- vim.keymap.set("n", "<leader>c", "<cmd>bdelete<cr>");
-- vim.keymap.set("n", "<leader>C", "<cmd>bdelete!<cr>");
vim.keymap.set("n", "<leader>c", function()
  require("bufdelete").bufdelete(0, false)
end)
vim.keymap.set("n", "<leader>C", function()
  require("bufdelete").bufdelete(0, true)
end)

-- cycle through buffers
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")

-- setup mapping to call :LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")

vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.keymap.set("n", "<leader>la", function()
  vim.lsp.buf.code_action()
end)
vim.keymap.set("v", "<leader>la", function()
  vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end)
