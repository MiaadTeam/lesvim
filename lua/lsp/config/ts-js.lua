-- local on_attach = require("lsp.lsp-setup").on_attach
local setup = require("lsp.lsp-setup")

local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

if file_exists(os.getenv("PWD") .. "/package.json") or file_exists(os.getenv("PWD") .. "/tsconfig.json") then
	require("lspconfig").tsserver.setup({
		capabilities = setup.capabilities,

		-- autostart = true,

		on_attach = require("lsp.lsp-attach").on_attach, -- This makes sure tsserver is not used for formatting (I prefer prettier)
		-- on_attach = require'lsp'.common_on_attach,
		-- root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
		settings = { documentFormatting = false },
		-- handlers = {
		-- 	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- 		virtual_text = O.tsserver.diagnostics.virtual_text,
		-- 		signs = O.tsserver.diagnostics.signs,
		-- 		underline = O.tsserver.diagnostics.underline,
		-- 		update_in_insert = true,
		-- 	}),
		-- },
	})
else
	require("lspconfig").denols.setup({
		capabilities = setup.capabilities,
		-- autostart = true,
		cmd = { "deno", "lsp" },
		on_attach = require("lsp.lsp-attach").on_attach,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		init_options = {
			enable = true,
			lint = true,
			unstable = true,
		},
	})
end
