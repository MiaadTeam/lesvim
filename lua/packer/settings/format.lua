-- require("format").setup({
-- 	["*"] = {
-- 		{ cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
-- 	},
-- 	vim = {
-- 		{
-- 			cmd = { "luafmt -w replace" },
-- 			start_pattern = "^lua << EOF$",
-- 			end_pattern = "^EOF$",
-- 		},
-- 	},
-- 	vimwiki = {
-- 		{
-- 			cmd = { "prettier -w --parser babel" },
-- 			start_pattern = "^{{{javascript$",
-- 			end_pattern = "^}}}$",
-- 		},
-- 	},
-- 	rust = {
-- 		{
-- 			cmd = { "rustfmt" },
-- 		},
-- 	},
-- 	lua = {
-- 		{
-- 			cmd = { "stylua" },
-- 		},
-- 	},
-- 	json = {
-- 		{
-- 			cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" },
-- 		},
-- 	},
-- 	go = {
-- 		{
-- 			cmd = { "gofmt -w", "goimports -w" },
-- 			tempfile_postfix = ".tmp",
-- 		},
-- 	},
-- 	typescriptreact = {
-- 		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
-- 	},
-- 	typescript = {
-- 		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
-- 	},
-- 	html = {
-- 		{ cmd = { "prettier -w" } },
-- 	},
-- 	javascriptreact = {
-- 		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
-- 	},
-- 	javascript = {
-- 		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
-- 	},
-- 	-- javascript = {
-- 	-- 	{ cmd = { "dprint fmt" } },
-- 	-- },
-- 	markdown = {
-- 		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
-- 	},
-- 	-- markdown = {
-- 	-- 	{ cmd = { "prettier -w" } },
-- 	-- 	{
-- 	-- 		cmd = { "black" },
-- 	-- 		start_pattern = "^```python$",
-- 	-- 		end_pattern = "^```$",
-- 	-- 		target = "current",
-- 	-- 	},
-- 	-- },
-- })

require("formatter").setup({
	filetype = {
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						-- "--config-path " .. os.getenv("XDG_CONFIG_HOME") .. "/stylua/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
		javascript = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		javascriptreact = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		typescript = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		typescriptreact = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
	},
})

-- vim.api.nvim_exec(
-- 	[[
-- augroup Format
--     autocmd!
--     autocmd BufWritePost * FormatWrite
-- augroup END
-- ]],
-- 	true
-- )

-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx FormatWrite
-- augroup END
-- ]],
-- 	true
-- )
--

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
