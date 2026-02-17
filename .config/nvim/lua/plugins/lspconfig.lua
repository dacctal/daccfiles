return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.diagnostic.config({
      update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      }
    })

    vim.diagnostic.config({ virtual_text = true })

    local lsp_configurations = require('lspconfig.configs')

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )
  end,
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts),
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts),
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
}
