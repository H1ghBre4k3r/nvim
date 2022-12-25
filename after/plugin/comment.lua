local comment = require("Comment.api");

vim.keymap.set("n", "<leader>/", function()
	comment.toggle.linewise.current()
end)

vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
