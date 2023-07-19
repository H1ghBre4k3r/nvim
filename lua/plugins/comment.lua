return {
  "numToStr/Comment.nvim",
  config = function()
    local comment = require("Comment")
    comment.setup()

    local api = require("Comment.api")
    vim.keymap.set("n", "<leader>/", function()
      api.toggle.linewise.current()
    end)

    vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
  end,
}
