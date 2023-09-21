return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  lazy = false,
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({ hidden = true, no_ignore = true })
    end, { desc = "Search all files" })

    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Search words in files" })
    vim.keymap.set("n", "<leader>fW", function()
      builtin.live_grep({
        additional_args = function(args)
          return vim.list_extend(args, { "--hidden", "--no-ignore" })
        end,
      })
    end, { desc = "Search words in all files" })

    -- search through all references
    vim.keymap.set("n", "<leader>lR", function()
      builtin.lsp_references()
    end, { desc = "Search references" })

    require("telescope").load_extension("ui-select")
  end,
}
