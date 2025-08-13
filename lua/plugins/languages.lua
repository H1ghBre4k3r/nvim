-- Language specific plugins
return {
  {
    src = 'https://github.com/mrcjkb/rustaceanvim',
    version = 'v6.7.0',
    config = function()
      vim.g.rustaceanvim = vim.tbl_deep_extend('force', {}, {
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>cR', function()
              vim.cmd.RustLsp 'codeAction'
            end, { desc = 'Code Action', buffer = bufnr })
            vim.keymap.set('n', '<leader>dr', function()
              vim.cmd.RustLsp 'debuggables'
            end, { desc = 'Rust debuggables', buffer = bufnr })
            -- require("lsp-inlayhints").on_attach(client, bufnr)
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = true,
              check = {
                features = 'all',
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        },
      })
    end,
  },
  {
    src = 'https://github.com/H1ghBre4k3r/y-lang.nvim',
  },
}
