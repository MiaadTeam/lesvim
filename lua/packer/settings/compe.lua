vim.o.completeopt = "menuone,noinsert,noselect"

require("compe").setup({

	resolve_timeout = 800,
	documentation = {
		border = { "", "", "", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	},

	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,

	source = {
		path = { kind = " Ôõó  (Path)" },
		buffer = { kind = " Ôêé  (Buffer)" },
		calc = { kind = " Ôá¨  (Calc)" },
		vsnip = { kind = " ÔÉÑ  (Snippet)" },
		nvim_lsp = { kind = " Óúñ  (LSP)" },
		nvim_lua = { kind = " ÓüÖ " },
		luasnip = { kind = " ÓüÖ " },

		spell = { kind = " Ôëà  (Spell)" },
		vim_dadbod_completion = true,
		-- snippets_nvim = {kind = " Ôóè "},
		-- ultisnips = {kind = " Ôóè "},
		-- treesitter = {kind = " ÔÜª "},
		emoji = { kind = " Ô≤É  (Emoji)", filetypes = { "markdown", "text" } },
		ultisnips = true,
	},
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif vim.fn["vsnip#available"](1) == 1 then
		return t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t("<S-Tab>")
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
