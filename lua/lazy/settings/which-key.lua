local M = {}

M.settings = {
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
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

M.normalOpts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.visualOpts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.vmappings = {
  ["/"] = { "<ESC><CMD>'<,'>lua require('Comment').toggle()<CR>", "Comment" },
  ["s"] = { "<ESC><CMD>'<,'>lua require('spectre').open_visual()<CR>", "Search and replace" },
  r = { "<cmd>lua require('renamer').rename()<CR>", "rename UI like VS-CODE" },
}

M.mappings = {
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["/"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" },
  ["c"] = { "<CMD>bd<CR>", "Close Buffer (bd)" },
  ["C"] = { "<CMD>close<CR>", "Close Buffer (close)" },
  ["e"] = { "<cmd>NvimTreeFindFileToggle!<CR>", "Explorer" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  ["h"] = { "<cmd>lua require'hop'.hint_words()<CR>", "Find word (HOP)" },
  ["n"] = { "<cmd>noh<CR>", "Turn off search highlight" },
  ["v"] = { "<CMD>NvimContextVtToggle<CR>", "Virtual text by treesitter" },
  r = {
    name = "Format & Replace & Regex ",
    f = { "<cmd>Format<CR>", "Format File" },
    r = { "<cmd>lua require('renamer').rename()<CR>", "rename UI like VS-CODE" },
    p = { "<cmd>lua require'regexplainer'.show { display = 'popup' }<CR>", "display Regex pattern in popup" },
    s = { "<cmd>lua require'regexplainer'.show { display = 'split' }<CR>", "display Regex pattern in split window" },
  },
  w = {
    name = "Windows Mannager",
    m = { "<cmd>WinShift<CR>", "Window manipulation" },
  },
  H = {
    name = "Http things",
    r = { "<CMD>lua require('rest-nvim').run()<CR>", "run the request under the cursor" },
    p = { "<CMD>lua require('rest-nvim').run(true)<CR>", "preview the request cURL command" },
    l = { "<CMD>lua require('rest-nvim').last()<CR>", "re-run the last request" },
  },
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
    name = "Lazy Plugins",
    i = { "<cmd>Lazy install<cr>", "install the package if a new package is available" },
    c = { "<cmd>Lazy check<cr>", "check plugins for available updates" },
    l = { "<cmd>Lazy log<cr>", "log plugins last release notes" },
    r = { "<cmd>Lazy restore<cr>", "restore plugins to prior commits" },
    p = { "<cmd>Lazy profile<cr>", "plugins profile" },
    d = { "<cmd>Lazy debug<cr>", "debugging plugins" },
    s = { "<cmd>Lazy sync<cr>", "sync packages with git repos" },
    u = { "<cmd>Lazy update<cr>", "update packages" },
    x = { "<cmd>Lazy clean<cr>", "clean unused package" },
    h = { "<cmd>Lazy help<cr>", "lazy plugin help" },
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
  o = {
    name = "+ Portal Jumplist",
    o = { "<cmd>lua require('portal').jump_backward()<cr>", "Jump backward" },
    i = { "<cmd>lua require('portal').jump_forward()<cr>", "Jump forward" },
    m = { "<cmd>lua require('portal.mark').toggle()<cr>", "marks jump list" },
  },
  m = {
    name = "+ Markdown Tools",
    t = { "<cmd>Glow<cr>", "Preview in terminal directly" },
    p = { "<CMD>MarkdownPreviewToggle<CR>", "Start/Stop Preview in default browser" },
  },
  l = {
    name = "LSP",
    -- a = {
    -- 	"<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
    -- 	"Code Action",
    -- },
    a = {
      "<cmd>Lspsaga code_action<cr>",
      "Code Action",
    },
    l = {
      "<cmd>Lspsaga show_line_diagnostics<cr>",
      "Line Diagnostics",
    },
    h = {
      "<cmd>Lspsaga hover_doc<cr>",
      "Lsp Hover Doc",
    },
    c = {
      "<cmd>Lspsaga show_cursor_diagnostics<cr>",
      "Line Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = {
      "<CMD>Lspsaga diagnostic_jump_next<CR>",
      "Next Diagnostic",
    },
    k = {
      "<CMD>Lspsaga diagnostic_jump_prev<CR>",
      "Prev Diagnostic",
    },
    n = {
      "<CMD>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
      "Next ERROR",
    },
    e = {
      "<CMD>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
      "Prev ERROR",
    },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    s = { "<cmd>Lspsaga lsp_finder<cr>", "find and search with LSP" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    o = {
      "<cmd>Lspsaga outline<cr>",
      "Open Outline",
    },
  },
  t = {
    name = "Float Terminal",
    t = { "<cmd>Lspsaga open_floaterm<cr>", "Open Terminal" },
    g = { "<cmd>Lspsaga open_floaterm gitui<cr>", "Open GitUI" },
    l = { "<cmd>Lspsaga open_floaterm lazygit<cr>", "Open lazygit" },
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
}

return M
