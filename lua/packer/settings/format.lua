require("format").setup({
	["*"] = {
		{ cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
	},
	vim = {
		{
			cmd = { "luafmt -w replace" },
			start_pattern = "^lua << EOF$",
			end_pattern = "^EOF$",
		},
	},
	vimwiki = {
		{
			cmd = { "prettier -w --parser babel" },
			start_pattern = "^{{{javascript$",
			end_pattern = "^}}}$",
		},
	},
	rust = {
		{
			cmd = { "rustfmt" },
		},
	},
	lua = {
		{
			cmd = { "stylua" },
		},
	},
	json = {
		{
			cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" },
		},
	},
	go = {
		{
			cmd = { "gofmt -w", "goimports -w" },
			tempfile_postfix = ".tmp",
		},
	},
	typescriptreact = {
		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
	},
	typescript = {
		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
	},
	html = {
		{ cmd = { "prettier -w" } },
	},
	javascriptreact = {
		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
	},
	javascript = {
		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
	},
	-- javascript = {
	-- 	{ cmd = { "dprint fmt" } },
	-- },
	markdown = {
		{ cmd = { "dprint fmt --config ~/.config/dotfiles/dpript/dprint.json" } },
	},
	-- markdown = {
	-- 	{ cmd = { "prettier -w" } },
	-- 	{
	-- 		cmd = { "black" },
	-- 		start_pattern = "^```python$",
	-- 		end_pattern = "^```$",
	-- 		target = "current",
	-- 	},
	-- },
})

vim.api.nvim_exec(
	[[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
