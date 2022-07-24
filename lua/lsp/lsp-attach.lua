local M = {}
local map = vim.keymap.set

local opts = { noremap = true, silent = true, buffer = 0 }

M.on_attach = function()
	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gt", vim.lsp.buf.type_definition, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	-- map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	-- map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	-- map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	-- map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	-- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	-- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	-- map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	map("n", "H", vim.diagnostic.open_float, opts)
	-- map("n", "<C-h>", "<cmd>lua vim.diagnostic.show()<CR>", opts)
	-- vim.api.nvim_exec(
	-- 	[[
	--         autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
	-- ]],
	-- 	false
	-- )
	-- vim.api.nvim_command([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])
end

return M
