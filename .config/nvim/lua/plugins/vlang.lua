return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').vlang.setup({})
  end,
  'ollykel/v-vim'
}
