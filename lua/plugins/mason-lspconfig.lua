local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

return {
  "williamboman/mason-lspconfig.nvim",
  opts ={
    ensure_installed = {},
    handlers = {
      default_setup,
    },
  }
}
