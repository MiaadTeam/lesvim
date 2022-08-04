local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local luasnip = require("luasnip")
local snippy = require("snippy")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- expand = function(args)
		-- 	require("luasnip").lsp_expand(args.body)
		-- end,
		expand = function(args)
			snippy.expand_snippet(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- elseif luasnip.expand_or_jumpable() then
				-- 	luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
				-- elseif luasnip.jumpable(-1) then
				-- 	luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		-- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),

		["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "vsnip" }, -- For vsnip users.
		-- { name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		{ name = "snippy" }, -- For snippy users.
		{ name = "emoji" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {},
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
