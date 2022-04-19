return {
	settings = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ...
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
			spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
	},

	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},

	vopts = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},

	vmappings = {
		["/"] = { "<ESC><CMD>'<,'>lua require('Comment').toggle()<CR>", "Comment" },
	},

	mappings = {
		["q"] = { "<cmd>q!<CR>", "Quit" },
		["/"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" },
		["c"] = { "<CMD>bd<CR>", "Close Buffer (bd)" },
		["C"] = { "<CMD>close<CR>", "Close Buffer (close)" },
		["e"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Explorer" },
		["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
		["r"] = { "<cmd>Format<CR>", "Reformat File" },
		["h"] = { "<cmd>lua require'hop'.hint_words()<CR>", "Find word (HOP)" },
		["v"] = { "<CMD>NvimContextVtToggle<CR>", "Virtual text by treesitter" },
		w = {
			name = "Windows Mannager",
			m = { "<cmd>WinShift<CR>", "Window manipulation" },
			c = { "<cmd>FocusSplitCycle<CR>", "Cycles Windows" },
			e = { "<cmd>FocusMaxOrEqual<CR>", "Maximize or equalize Windows" },
			n = { "<cmd>FocusSplitNicely<CR>", "Split Windows nicely" },
			l = { "<cmd>FocusSplitRight<CR>", "Split Windows Right" },
			h = { "<cmd>FocusSplitLeft<CR>", "Split Windows Left" },
			j = { "<cmd>FocusSplitUp<CR>", "Split Windows Up" },
			k = { "<cmd>FocusSplitDown<CR>", "Split Windows Down" },
		},
		H = {
			name = "Http things",
			r = { "<CMD>lua require('rest-nvim').run()<CR>", "run the request under the cursor" },
			p = { "<CMD>lua require('rest-nvim').run(true)<CR>", "preview the request cURL command" },
			l = { "<CMD>lua require('rest-nvim').last()<CR>", "re-run the last request" },
		},
		["t"] = { "<cmd>CodeActionMenu<CR>", "Code Action Menu" },
		b = {
			name = "Buffers",
			j = { "<cmd>BufferLinePick<CR>", "jump to buffer" },
			f = { "<cmd>Telescope buffers<CR>", "Find buffer" },
			w = { "<cmd>%bd|e#|bd#<CR>", "wipeout buffer" },
			r = {
				"<cmd>BufferLineCloseRight<cr>",
				"close all BufferLines to the right",
			},
			l = {
				"<cmd>BufferLineCloseLeft<cr>",
				"close all BufferLines to the left",
			},
			d = {
				"<cmd>BufferLineSortByDirectory<cr>",
				"sort BufferLines automatically by directory",
			},
			n = {
				"<cmd>BufferLineSortByExtension<cr>",
				"sort BufferLines automatically by language",
			},
			t = {
				"<cmd>BufferLineSortByTabs<cr>",
				"sort BufferLines automatically by Tabs",
			},
		},
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			r = { "<cmd>PackerClean<cr>", "Clean" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		-- " Available Debug Adapters:
		-- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
		-- " Adapter configuration and installation instructions:
		-- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		-- " Debug Adapter protocol:
		-- "   https://microsoft.github.io/debug-adapter-protocol/
		-- " Debugging
		g = {
			name = "Git",
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			C = {
				"<cmd>Telescope git_bcommits<cr>",
				"Checkout commit(for current file)",
			},
		},

		m = {
			name = "+ Markdown Tools",
			t = { "<cmd>Glow<cr>", "Preview in terminal directly" },
			p = { "<CMD>MarkdownPreviewToggle<CR>", "Start/Stop Preview in default browser" },
		},
		l = {
			name = "LSP",
			a = {
				"<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
				"Code Action",
			},
			d = {
				"<cmd>Telescope lsp_document_diagnostics<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Telescope lsp_workspace_diagnostics<cr>",
				"Workspace Diagnostics",
			},
			-- f = { "<cmd>silent FormatWrite<cr>", "Format" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			j = {
				"<CMD>lua vim.lsp.diagnostic.goto_next()<CR>",
				"Next Diagnostic",
			},
			k = {
				"<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>",
				"Prev Diagnostic",
			},
			p = {
				name = "Peek",
				d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
				t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
				i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
			},
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			t = {
				"<cmd>TroubleToggle<cr>",
				"Find Document or Project troubles",
			},
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			t = { "<cmd>Telescope live_grep<cr>", "Text" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			p = {
				"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
				"Colorscheme with Preview",
			},
			g = { "<CMD>lua require('spectre').open()<CR>", "Search and replace with rg" },
			w = {
				"<CMD>lua require('spectre').open_visual({select_word=true})<CR>",
				"Search and replace with rg (select word under cursor)",
			},
			l = {
				"<CMD>lua require('spectre').open_file_search()<CR>",
				"Search and replace with rg (active buffer set to path)",
			},
		},
		T = {
			name = "Treesitter",
			i = { ":TSConfigInfo<cr>", "Info" },
		},
		z = {
			name = "Spell",
			t = { "<CMD>set spell!<CR>", "toggle spell checker" },
			p = { "<CMD>normal! mz[s1z=`z<CR>", "pick first suggest in spell checker" },
		},
		y = {
			name = "+ Yode Plugin",
			c = { "<CMD>YodeCreateSeditorFloating<CR>", "Create floatin section" },
			r = { "<CMD>YodeCreateSeditorReplace<CR>", "Create replace section" },
			d = { "<CMD>YodeBufferDelete<CR>", "Delete Yoda buffer" },
			-- split window keys
			j = { "<CMD>YodeLayoutShiftWinDown<CR>", "Shift down" },
			k = { "<CMD>YodeLayoutShiftWinUp<CR>", "Shift up" },
			l = { "<CMD>YodeLayoutShiftWinBottom<CR>", "Shift bottom" },
			h = { "<CMD>YodeLayoutShiftWinTop<CR>", "Shift top" },
		},
	},
}
