local setup = require("lsp.lsp-setup")

require("lspconfig").rust_analyzer.setup({
	capabilities = setup.capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

-- local nvim_lsp = require("lspconfig")
--
-- local on_attach = function(client)
-- 	require("completion").on_attach(client)
-- end
--
-- nvim_lsp.rust_analyzer.setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			assist = {
-- 				importGranularity = "module",
-- 				importPrefix = "by_self",
-- 			},
-- 			cargo = {
-- 				loadOutDirsFromCheck = true,
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 		},
-- 	},
-- })
