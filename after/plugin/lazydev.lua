-- Configure lazydev for Lua development
require('lazydev').setup {
  library = { {
    path = '${3rd}/luv/library',
    words = { 'vim%.uv' },
  } },
}
