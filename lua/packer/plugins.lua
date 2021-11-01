vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim") -- Package manager
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("hrsh7th/vim-vsnip")
	use("yamatsum/nvim-cursorline")
	use({ "turbio/bracey.vim", run = "npm install --prefix server" })
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
	-- use("airblade/vim-rooter")
	use({
		"rafamadriz/friendly-snippets",
		event = "InsertCharPre",
	})
	-- use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })
	-- use("joshdick/onedark.vim") -- Theme inspired by Atom
	use({
		"folke/tokyonight.nvim",
	})
	-- use("itchyny/lightline.vim") -- Fancier statusline
	use({
		"windwp/windline.nvim",
	}) -- Fancier statusline
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use({
	-- 	"hrsh7th/nvim-compe",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("packer.settings.compe")
	-- 	end,
	-- }) -- Autocompletion plugin

	use("onsails/lspkind-nvim")
	use({
		"hrsh7th/nvim-cmp",

		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),

					["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
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
		end,
	}) -- Autocompletion plugin

	use("norcalli/snippets.nvim") -- Snippets plugin
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			--			require("nvim-autopairs.completion.compe").setup({
			--				map_complete = true, -- it will auto insert `(` after select function or method item
			--				auto_select = false, -- auto select first item
			--			})

			require("packer.settings.autopairs")
		end,
	})

	-- Built-in Terminal
	use({ "akinsho/nvim-toggleterm.lua" })
	use("pianocomposer321/consolation.nvim")

	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/cmp-nvim-lsp")
	-- use({ "kabouzeid/nvim-lspinstall" })

	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				require("packer.settings.bufferline"),
			})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			-- local myTreeConfig = require("packer.settings.nvimtree")
			local tree_cb = require("nvim-tree.config").nvim_tree_callback
			require("nvim-tree").setup({
				-- local tree_cb = require("nvim-tree.config").nvim_tree_callback
				-- local list = {
				--     				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				-- 				{ key = "h", cb = tree_cb("close_node") },
				-- 				{ key = "v", cb = tree_cb("vsplit") },
				-- }
				view = {
					mappings = {
						custom_only = false,
						list = {
							{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
							{ key = "h", cb = tree_cb("close_node") },
							{ key = "v", cb = tree_cb("vsplit") },
						},
					},
				},
			})
			-- local g = vim.g
			-- for opt, val in pairs(myTreeConfig) do
			-- 	g["nvim_tree_" .. opt] = val
			-- end
			local list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			}
		end,
	})

	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	config = function()
	-- 		local myTreeConfig = require("packer.settings.nvimtree")
	-- 		local g = vim.g
	-- 		local tree_cb = require("nvim-tree.config").nvim_tree_callback
	-- 		for opt, val in pairs(myTreeConfig) do
	-- 			g["nvim_tree_" .. opt] = val
	-- 		end
	-- 		g.nvim_tree_bindings = {
	-- 			{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
	-- 			{ key = "h", cb = tree_cb("close_node") },
	-- 			{ key = "v", cb = tree_cb("vsplit") },
	-- 		}
	-- 	end,
	-- })
	use("nathom/filetype.nvim")

	-- dims inactive portions of the code you're editing
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"lukas-reineke/format.nvim",
		config = function()
			require("packer.settings.format")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			local myWKConfig = require("packer.settings.which-key")
			local wk = require("which-key")
			wk.setup({
				myWKConfig.settings,
			})
			local opts = myWKConfig.opts
			local vopts = myWKConfig.opts

			local mappings = myWKConfig.mappings
			local vmappings = myWKConfig.vmappings

			wk.register(mappings, opts)
			-- wk.register(vmappings, vopts)
			wk.register({
				["/"] = { "<ESC><CMD>'<,'>CommentToggle<CR>", "Comment" },
			}, {
				mode = "v", -- VISUAL mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
			})
		end,
	})
	use({
		"terrortylor/nvim-comment",
		event = "BufRead",
		config = function()
			require("nvim_comment").setup()
		end,
	})
	use({ "ellisonleao/glow.nvim" })
end)
