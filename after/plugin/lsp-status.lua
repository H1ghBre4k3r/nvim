local lsp_status = require("lsp-status")
lsp_status.register_progress()

function LspStatus()
    if vim.lsp.buf_get_clients() > 0 then
        return require('lsp-status').status()
    end

    return ''
end

vim.api.nvim_exec([[
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
]], true)
