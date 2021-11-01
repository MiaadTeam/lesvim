local setup = require("lsp.lsp-setup")

require("lspconfig").rust_analyzer.setup({
	capabilities = setup.capabilities,
})
