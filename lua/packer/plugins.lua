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
	use("yamatsum/nvim-cursorline")

	use({ "turbio/bracey.vim", run = "npm install --prefix server" })
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })

	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("renamer").setup({
				-- The popup title, shown if `border` is true
				title = "Rename",
				-- Whether or not to highlight the current word references through LSP
				show_refs = true,
				-- Whether or not to add resulting changes to the quickfix list
				with_qf_list = true,
				-- Whether or not to enter the new name through the UI or Neovim's `input`
				-- prompt
				with_popup = true,
				-- The keymaps available while in the `renamer` buffer. The example below
			})
		end,
	})

	use({ "windwp/nvim-ts-autotag" })

	use({
		"windwp/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
	})

	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- a lua powered greeter like vim-startify / dashboard-nvim
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					-- ...
				},
				-- ...
				rainbow = {
					enable = true,
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	})

	-- a lua powered greeter like vim-startify / dashboard-nvim
	use({
		"goolord/alpha-nvim",
		config = function()
			require("packer.settings.alpha")
		end,
	})

	-- indeting with colorize
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- vim.opt.termguicolors = true
			vim.cmd([[highlight IndentHighlightListBlank1 guifg=#E06C75 gui=nocombine]])
			vim.cmd([[highlight IndentHighlightListBlank2 guifg=#E5C07B gui=nocombine]])
			vim.cmd([[highlight IndentHighlightListBlank3 guifg=#98C379 gui=nocombine]])
			vim.cmd([[highlight IndentHighlightListBlank4 guifg=#56B6C2 gui=nocombine]])
			vim.cmd([[highlight IndentHighlightListBlank5 guifg=#61AFEF gui=nocombine]])
			vim.cmd([[highlight IndentHighlightListBlank6 guifg=#C678DD gui=nocombine]])

			vim.opt.termguicolors = true
			vim.cmd([[highlight IndentBlanklineIndent1 guibg=#291d29 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1f2b28 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent3 guibg=#2f2a3b gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent4 guibg=#262933 gui=nocombine]])

			vim.opt.list = true
			-- vim.opt.listchars:append("space:—")
			vim.opt.listchars:append("eol:↴")

			require("indent_blankline").setup({
				space_char_blankline = " ",
				char_highlight_list = {
					"IndentHighlightListBlank1",
					"IndentHighlightListBlank2",
					"IndentHighlightListBlank3",
					"IndentHighlightListBlank4",
					"IndentHighlightListBlank5",
					"IndentHighlightListBlank6",
				},

				space_char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
					"IndentBlanklineIndent3",
					"IndentBlanklineIndent4",
				},
				show_trailing_blankline_indent = false,
			})
		end,
	})

	-- Rearrange your windows with ease
	use({
		"sindrets/winshift.nvim",
		config = function()
			require("winshift").setup({
				highlight_moving_win = true, -- Highlight the window being moved
				focused_hl_group = "Visual", -- The highlight group used for the moving window
				moving_win_options = {
					-- These are local options applied to the moving window while it's
					-- being moved. They are unset when you leave Win-Move mode.
					wrap = false,
					cursorline = false,
					cursorcolumn = false,
					colorcolumn = "",
				},
			})
		end,
	})

	-- use("airblade/vim-rooter")
	-- use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })

	use({
		"folke/tokyonight.nvim",
	})

	use({
		"windwp/windline.nvim",
		config = function()
			require("packer.settings.windline")
			require("windline").add_status(require("spectre.state_utils").status_line())
		end,
	}) -- Fancier statusline

	-- Add git related info in the signs columns and popups
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		-- tag = 'release' -- To use the latest release
	})

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({
		"nvim-treesitter/nvim-treesitter",

		config = function()
			require("packer.settings.treesitter")
		end,
	})
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")

	use("onsails/lspkind-nvim")

	-- LSP things autocomplition and etc
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("packer.settings.luasnip")
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},

		-- event = "InsertEnter",
		config = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
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
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
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
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
				},
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
	use("saadparwaiz1/cmp_luasnip")

	use("tversteeg/registers.nvim") --

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

	-- use({ "kabouzeid/nvim-lspinstall" })

	use({
		"glepnir/lspsaga.nvim",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("lspsaga").init_lsp_saga()
		end,
	})

	use("kosayoda/nvim-lightbulb")

	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

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
				update_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
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

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				require("telescope").load_extension("projects"),
			})
		end,
	})

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
			require("trouble").setup({})
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
				["/"] = { "<ESC><CMD>'<,'>lua require('Comment').toggle()<CR>", "Comment" },
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

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				-- -@param ctx Ctx
				pre_hook = function(ctx)
					-- Only calculate commentstring for tsx filetypes
					if vim.bo.filetype == "typescriptreact" then
						local U = require("Comment.utils")

						-- Detemine whether to use linewise or blockwise commentstring
						local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

						-- Determine the location where to calculate commentstring from
						local location = nil
						if ctx.ctype == U.ctype.block then
							location = require("ts_context_commentstring.utils").get_cursor_location()
						elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
							location = require("ts_context_commentstring.utils").get_visual_start_location()
						end

						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = type,
							location = location,
						})
					end
				end,
			})
		end,
	})

	use({ "ellisonleao/glow.nvim" })
end)
