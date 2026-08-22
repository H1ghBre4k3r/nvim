-- Treesitter for syntax highlighting
return {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  config = function()
    local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }

    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }
    require('nvim-treesitter').install(parsers)
    require('nvim-treesitter').update()

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('kickstart-treesitter', { clear = true }),
      pattern = { 'bash', 'c', 'diff', 'html', 'lua', 'markdown', 'query', 'vim', 'help' },
      callback = function(event)
        vim.treesitter.start(event.buf)
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
