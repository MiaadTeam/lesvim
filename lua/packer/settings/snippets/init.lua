require("snippets").debug(false)
 require'snippets'.use_suggested_mappings()
 require'snippets'.use_suggested_mappings(true)

require("snippets").snippets = {
    typescript = {
		llog = [[console.log($1)]],
		llg = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    },
    typescriptreact = {
		llog = [[console.log($1)]],
		llg = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    },
    javascriptreact = {
		llog = [[console.log($1)]],
		llg = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    },
    javascript = {
		llog = [[console.log($1)]],
		llg = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    },
	_global = {
		llog = [[console.log($1)]],
		llg = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
	},
}

vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'snippets'.expand_or_advance(1)<CR>", { expr = true })
vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'snippets'.expand_or_advance(-1)<CR>", { expr = true })
