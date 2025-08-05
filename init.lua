--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 16

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode',
})

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {
  desc = 'Move focus to the left window',
})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {
  desc = 'Move focus to the right window',
})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {
  desc = 'Move focus to the lower window',
})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {
  desc = 'Move focus to the upper window',
})

vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
    clear = true,
  }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.pack.add {
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },
  {
    src = 'https://github.com/NMAC427/guess-indent.nvim',
  }, -- Detect tabstop and shiftwidth automatically
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
  },
  {
    src = 'https://github.com/folke/which-key.nvim',
  },
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  },
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
  },
  {
    src = 'https://github.com/folke/lazydev.nvim',
  },
  {
    src = 'https://github.com/mason-org/mason.nvim',
  },
  {
    src = 'https://github.com/mason-org/mason-lspconfig.nvim',
  },
  {
    src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  {
    src = 'https://github.com/j-hui/fidget.nvim',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
  },
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
  },
  {
    src = 'https://github.com/stevearc/conform.nvim',
  },
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
  },
  {
    src = 'https://github.com/folke/tokyonight.nvim',
  },
  {
    src = 'https://github.com/folke/todo-comments.nvim',
  },
  {
    src = 'https://github.com/echasnovski/mini.nvim',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  },
  { src = 'https://github.com/mrcjkb/rustaceanvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
}

-- Configure lazydev for Lua development
require('lazydev').setup {
  library = { {
    path = '${3rd}/luv/library',
    words = { 'vim%.uv' },
  } },
}

-- Configure Mason and LSP (plugins already added above)
require('mason').setup {}
require('fidget').setup {}

-- LSP configuration
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', {
    clear = true,
  }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, {
        buffer = event.buf,
        desc = 'LSP: ' .. desc,
      })
    end

    map('gn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
    map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

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

-- Configure formatting (conform.nvim already added above)
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = {
      c = true,
      cpp = true,
    }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
  },
}

vim.keymap.set('', '<leader>f', function()
  require('conform').format {
    async = true,
    lsp_format = 'fallback',
  }
end, {
  desc = '[F]ormat buffer',
})

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
    enabled = true,
  },
}

-- Configure colorscheme (tokyonight already added above)
require('catppuccin').setup {
  transparent_background = true,
  integrations = {
    aerial = true,
    alpha = true,
    cmp = true,
    dashboard = true,
    flash = true,
    gitsigns = true,
    headlines = true,
    illuminate = true,
    indent_blankline = { enabled = true },
    leap = true,
    lsp_trouble = true,
    mason = true,
    markdown = true,
    mini = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
      inlay_hints = {
        background = true,
      },
    },
    navic = { enabled = true, custom_bg = 'lualine' },
    neotest = true,
    neotree = true,
    noice = true,
    notify = true,
    semantic_tokens = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
  },
  custom_highlights = function(_colors)
    return {
      CmpDocNormal = { bg = '#414559' },
      NormalFloat = { bg = '#414559' },
    }
  end,
}
vim.cmd.colorscheme 'catppuccin-frappe'

-- Configure todo-comments (already added above)
require('todo-comments').setup {
  signs = false,
}

-- Configure mini.nvim (already added above)
require('mini.ai').setup {
  n_lines = 500,
}
require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup {
  use_icons = vim.g.have_nerd_font,
}
statusline.section_location = function()
  return '%2l:%-2v'
end

-- Configure treesitter (already added above)
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = {
    enable = true,
    disable = { 'ruby' },
  },
}

-- Update treesitter parsers
vim.cmd 'TSUpdate'
