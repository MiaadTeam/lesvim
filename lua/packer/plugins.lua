local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("tpope/vim-fugitive") -- Git commands in nvim
  use("yamatsum/nvim-cursorline")

  use({ "turbio/bracey.vim", run = "npm install --prefix server" })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })

  use({
    "filipdutescu/renamer.nvim",
    branch = "master",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("packer.settings.renamer")
    end,
  })

  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  use({
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
  })

  use({
    "tpope/vim-surround",
  })

  use({
    "bennypowers/nvim-regexplainer",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("regexplainer").setup()
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
      require("packer.settings.rainbow")
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
      require("packer.settings.blankline")
    end,
  })

  -- Rearrange your windows with ease
  use({
    "sindrets/winshift.nvim",
    config = function()
      require("packer.settings.winshift")
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
      -- require("windline").add_status(require("spectre.state_utils").status_line())
    end,
  }) -- Fancier statusline

  -- Add git related info in the signs columns and popups
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  })

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("packer.settings.treesitter")
    end,
  })
  -- Additional textobjects for treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")
  -- Show code context in the above
  use("romgrk/nvim-treesitter-context")

  use({
    "glepnir/lspsaga.nvim",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("lspsaga").init_lsp_saga()
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

  -- LSP things autocomplition and etc
  use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  -- disable luasnip because of issue on coupling entire documents relates to this issue https://github.com/L3MON4D3/LuaSnip/issues/265
  -- use({
  -- 	"L3MON4D3/LuaSnip",
  -- 	config = function()
  -- 		require("packer.settings.luasnip")
  -- 	end,
  -- })

  use({
    "dcampos/nvim-snippy",
    config = function()
      require("snippy").setup({
        mappings = {
          is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
          },
          nx = {
            ["<leader>x"] = "cut_text",
          },
        },
      })
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- "L3MON4D3/LuaSnip",
      -- "saadparwaiz1/cmp_luasnip",
      "dcampos/nvim-snippy",
      "dcampos/cmp-snippy",
      "hrsh7th/cmp-emoji",
    },

    -- event = "InsertEnter",
    config = function()
      require("packer.settings.cmp")
    end,
  }) -- Autocompletion plugin

  -- use("saadparwaiz1/cmp_luasnip")
  use("dcampos/cmp-snippy")

  use("tversteeg/registers.nvim") --

  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("packer.settings.autopairs")
    end,
  })

  -- Built-in Terminal -- Remove inside terminal in favor of `wezterm built-in pane and tab`
  -- use({ "akinsho/nvim-toggleterm.lua" })
  -- use("pianocomposer321/consolation.nvim")

  -- use({ "kabouzeid/nvim-lspinstall" })

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
      require("packer.settings.tree")
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

  -- TODO replace this plugin with mhartington/formatter.nvim
  -- use({
  -- 	"lukas-reineke/format.nvim",
  -- 	config = function()
  -- 		require("packer.settings.format")
  -- 	end,
  -- })
  use({
    "mhartington/formatter.nvim",
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
      local opts = myWKConfig.normalOpts
      local vopts = myWKConfig.visualOpts

      local mappings = myWKConfig.mappings
      local vmappings = myWKConfig.vmappings

      wk.register(mappings, opts)
      wk.register(vmappings, vopts)
    end,
  })

  use("JoosepAlviste/nvim-ts-context-commentstring")

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("packer.settings.ts-comment")
    end,
  })

  use({
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  })

  use({ "ellisonleao/glow.nvim" })

  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("packer.settings.rest")
    end,
  })
  use({ "kevinhwang91/nvim-hlslens" })

  use({
    "simrat39/rust-tools.nvim",
    config = function()
      require("packer.settings.rust")
    end,
  })

  -- cargo crates for rust toml file
  use({
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  })

  use({ "mfussenegger/nvim-dap" })

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- use({
  --   "/Users/syd/work/GitRepo/forks/null-ls.nvim",
  -- })

  -- use({
  -- 	"beauwilliams/focus.nvim",
  -- 	config = function()
  -- 		-- require("focus").setup({ relativenumber = true, excluded_filetypes = { "toggleterm" } })
  -- 		require("focus").setup()
  -- 	end,
  -- })

  use({
    "hoschi/yode-nvim",
    config = function()
      require("yode-nvim").setup({})
    end,
  })
  use({
    "haringsrob/nvim_context_vt",
  })

  use({ "pgdouyon/vim-yin-yang" })

  use({
    "max397574/better-escape.nvim",
    config = function()
      require("packer.settings.escape")
    end,
  })
  -- use({
  -- 	"VonHeikemen/fine-cmdline.nvim",
  -- 	requires = {
  -- 		{ "MunifTanjim/nui.nvim" },
  -- 	},
  -- })

  use({
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  })
  use({ "github/copilot.vim" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
