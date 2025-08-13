-- Terminal integration
return {
  src = 'https://github.com/akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup()
  end,
}
