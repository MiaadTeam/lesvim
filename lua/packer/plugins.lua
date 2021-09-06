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
	use({ "turbio/bracey.vim", run = "npm install --prefix server" })
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
	use("airblade/vim-rooter")
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
	use({
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("packer.settings.compe")
		end,
	}) -- Autocompletion plugin
	use("norcalli/snippets.nvim") -- Snippets plugin
	use({
		"windwp/nvim-autopairs",
		after = "nvim-compe",
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

	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use({ "kabouzeid/nvim-lspinstall" })

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
			local myTreeConfig = require("packer.settings.nvimtree")
			local g = vim.g
			local tree_cb = require("nvim-tree.config").nvim_tree_callback
			for opt, val in pairs(myTreeConfig) do
				g["nvim_tree_" .. opt] = val
			end
			g.nvim_tree_bindings = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			}
		end,
	})

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
			wk.register(vmappings, vopts)
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
