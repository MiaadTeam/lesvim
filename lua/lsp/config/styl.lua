local config = {
	on_attach = require("lsp.lsp-attach").on_attach,
}

if vim.lsp.config then
	vim.lsp.config("stylelint_lsp", config)
	vim.lsp.enable("stylelint_lsp")
else
	require("lspconfig").stylelint_lsp.setup(config)
end
