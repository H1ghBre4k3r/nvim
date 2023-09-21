return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    local comment = require("Comment")
    comment.setup()

    vim.keymap.set("n", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>")

    vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
  end,
}
