local setup = require("lsp.lsp-setup")

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
-- local capabilities = require("lsp.lsp-setup")

-- Setup lspconfig.

lspconfig.cssls.setup({
	capabilities = setup.capabilities,
})

lspconfig.html.setup({
	capabilities = setup.capabilities,
})

if not lspconfig.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css", "blade" },
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end
lspconfig.emmet_ls.setup({ capabilities = setup.capabilities })
