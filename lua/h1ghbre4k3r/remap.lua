vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- toggle term configuration
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]);

-- diagnostics
vim.keymap.set('n', '<leader>lD', function() require("telescope.builtin").diagnostics() end);
vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end);
