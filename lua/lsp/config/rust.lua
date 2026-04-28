local setup = require("lsp.lsp-setup")

local on_attach = function(client)
	require("completion").on_attach(client)
	require("lsp.lsp-attach").on_attach()
end

local rust_analyzer_config = {
	on_attach = on_attach,
	capabilities = setup.capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
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
			hoverActions = {
				references = true,
			},
			inlayHints = {
				hideNamedConstructorHints = true,
			},
			lens = {
				enumVariantReferences = true,
				methodReferences = true,
				references = true,
			},
			rustfmt = {
				enableRangeFormatting = true,
			},
		},
	},
}

if vim.lsp.config then
	vim.lsp.config("rust_analyzer", rust_analyzer_config)
	vim.lsp.enable("rust_analyzer")
else
	require("lspconfig").rust_analyzer.setup(rust_analyzer_config)
end

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
