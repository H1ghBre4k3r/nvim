return {
  -- {
  --   "tikhomirov/vim-glsl",
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        glsl_analyzer = {},
      },
      setup = {},
    },
  },
}
