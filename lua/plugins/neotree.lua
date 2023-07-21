return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function(_)
          if vim.bo.filetype == "neo-tree" then
            vim.wo.signcolumn = "auto"
          end
        end,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<cr>",
    },
    {
      "<leader>o",
      "<cmd>Neotree focus<cr>",
    },
  },
}
