vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- toggle term configuration
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]);
