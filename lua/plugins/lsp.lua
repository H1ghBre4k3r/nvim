-- LSP and completion related plugins
return {
  {
    src = 'https://github.com/mason-org/mason.nvim',
    config = function()
      require('mason').setup {}
    end,
  },
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
    config = function()
      -- LSP configuration
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', {
          clear = true,
        }),
        callback = function(event)
          vim.lsp.semantic_tokens.enable(true, {
            bufnr = event.buf,
          })
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, {
              buffer = event.buf,
              desc = 'LSP: ' .. desc,
            })
          end

          map('lr', vim.lsp.buf.rename, '[R]ename')
          map('ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          map('<leader>lR', require('telescope.builtin').lsp_references, '[L]ist [R]eferences')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          map('<leader>la', vim.lsp.buf.code_action, '[L]ist Code [A]ctions')
          map('<leader>la', vim.lsp.buf.code_action, '[L]ist Code [A]ctions', 'v')

          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, {
                bufnr = bufnr,
              })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', {
              clear = false,
            })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', {
                clear = true,
              }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds {
                  group = 'kickstart-lsp-highlight',
                  buffer = event2.buf,
                }
              end,
            })
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {
                bufnr = event.buf,
              })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'if_many',
        },
        underline = {
          severity = vim.diagnostic.severity.ERROR,
        },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP capabilities and server setup
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua' })
      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      if vim.fn.executable('sourcekit-lsp') == 1 then
        vim.lsp.config('sourcekit', {
          capabilities = capabilities,
        })
        vim.lsp.enable('sourcekit')
      else
        vim.notify('sourcekit-lsp not found in PATH', vim.log.levels.WARN)
      end
    end,
  },
  {
    src = 'https://github.com/mason-org/mason-lspconfig.nvim',
  },
  {
    src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  {
    src = 'https://github.com/j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}
    end,
  },
  {
    src = 'https://github.com/saghen/blink.lib',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
    config = function()
      -- Configure completion (LuaSnip already added above)
      -- Build LuaSnip regex support if make is available
      if vim.fn.has 'win32' == 0 and vim.fn.executable 'make' == 1 then
        vim.fn.system('cd ' .. vim.fn.stdpath 'data' .. '/site/pack/*/start/LuaSnip && make install_jsregexp')
      end

      -- Configure blink.cmp
      require('blink.cmp').setup {
        keymap = {
          preset = 'enter',
          ['<C-y>'] = { 'select_and_accept' },
          ['<Tab>'] = {},
        },
        appearance = {
          nerd_font_variant = 'mono',
        },
        completion = {
          accept = {
            auto_brackets = {
              enabled = false,
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          },
          trigger = {
            show_on_keyword = true,
          },
          list = {
            selection = {
              auto_insert = false,
              -- preselect = false,
            },
          },
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'lazydev' },
          providers = {
            lazydev = {
              module = 'lazydev.integrations.blink',
              score_offset = 100,
            },
          },
        },
        snippets = {
          preset = 'luasnip',
        },
        fuzzy = {
          implementation = 'lua',
        },
        signature = {
          enabled = false,
        },
      }
    end,
  },
  {
    src = 'https://github.com/folke/lazydev.nvim',
    config = function()
      require('lazydev').setup {
        library = { {
          path = '${3rd}/luv/library',
          words = { 'vim%.uv' },
        } },
      }
    end,
  },
}
