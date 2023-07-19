return {
  "numToStr/Comment.nvim",
  config = function()
    local comment = require("Comment")
    comment.setup()

    vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
  end,
  keys = {
    {
      "<leader>/",
      "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
    },
  },
}
