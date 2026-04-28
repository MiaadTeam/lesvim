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
  win = {
    border = "rounded", -- none, single, double, shadow
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left",
  },
  show_help = true, -- show help message on the command line when the popup is visible
}

local function map(lhs, rhs, desc, mode)
  return { lhs, rhs, desc = desc, mode = mode, nowait = true, remap = false }
end

local function group(lhs, desc, mode)
  return { lhs, group = desc, mode = mode, nowait = true, remap = false }
end

M.normal_mappings = {
  map("<leader>/", "<cmd>lua require('Comment').toggle()<CR>", "Comment", "n"),
  map("<leader>C", "<CMD>close<CR>", "Close Buffer (close)", "n"),
  group("<leader>H", "Http things", "n"),
  map("<leader>Hl", "<CMD>Rest last<CR>", "re-run the last request", "n"),
  map("<leader>Hp", "<CMD>Rest open<CR>", "open the response window", "n"),
  map("<leader>Hr", "<CMD>Rest run<CR>", "run the request under the cursor", "n"),
  group("<leader>T", "Treesitter", "n"),
  map("<leader>Ti", ":TSConfigInfo<cr>", "Info", "n"),
  group("<leader>b", "Buffers", "n"),
  map("<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", "sort BufferLines automatically by directory", "n"),
  map("<leader>bf", "<cmd>Telescope buffers<CR>", "Find buffer", "n"),
  map("<leader>bj", "<cmd>BufferLinePick<CR>", "jump to buffer", "n"),
  map("<leader>bl", "<cmd>BufferLineCloseLeft<cr>", "close all BufferLines to the left", "n"),
  map("<leader>bn", "<cmd>BufferLineSortByExtension<cr>", "sort BufferLines automatically by language", "n"),
  map("<leader>br", "<cmd>BufferLineCloseRight<cr>", "close all BufferLines to the right", "n"),
  map("<leader>bt", "<cmd>BufferLineSortByTabs<cr>", "sort BufferLines automatically by Tabs", "n"),
  map("<leader>bw", "<cmd>%bd|e#|bd#<CR>", "wipeout buffer", "n"),
  map("<leader>c", "<CMD>bd<CR>", "Close Buffer (bd)", "n"),
  map("<leader>e", "<cmd>NvimTreeFindFileToggle!<CR>", "Explorer", "n"),
  map("<leader>f", "<cmd>Telescope find_files<CR>", "Find File", "n"),
  group("<leader>g", "Git", "n"),
  map("<leader>gC", "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)", "n"),
  map("<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", "n"),
  map("<leader>gb", "<cmd>Telescope git_branches<cr>", "Checkout branch", "n"),
  map("<leader>gc", "<cmd>Telescope git_commits<cr>", "Checkout commit", "n"),
  map("<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk", "n"),
  map("<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk", "n"),
  map("<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame", "n"),
  map("<leader>go", "<cmd>Telescope git_status<cr>", "Open changed file", "n"),
  map("<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk", "n"),
  map("<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk", "n"),
  map("<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk", "n"),
  map("<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", "n"),
  map("<leader>h", "<cmd>lua require'hop'.hint_words()<CR>", "Find word (HOP)", "n"),
  group("<leader>l", "LSP", "n"),
  map("<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", "n"),
  map("<leader>la", "<cmd>Lspsaga code_action<cr>", "Code Action", "n"),
  map("<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", "Buffer Diagnostics", "n"),
  map("<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Line Diagnostics", "n"),
  map("<leader>le", "<CMD>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", "Prev ERROR", "n"),
  map("<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", "LSP Format", "n"),
  map("<leader>lh", "<cmd>Lspsaga hover_doc<cr>", "Lsp Hover Doc", "n"),
  map("<leader>li", "<cmd>LspInfo<cr>", "Info", "n"),
  map("<leader>lj", "<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic", "n"),
  map("<leader>lk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic", "n"),
  map("<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics", "n"),
  map("<leader>ln", "<CMD>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", "Next ERROR", "n"),
  map("<leader>lo", "<cmd>Lspsaga outline<cr>", "Open Outline", "n"),
  map("<leader>lp", "<cmd>Lspsaga peek_definition<cr>", "Peek Definition", "n"),
  map("<leader>lr", "<cmd>Lspsaga rename<cr>", "Rename", "n"),
  map("<leader>ls", "<cmd>Lspsaga finder<cr>", "find and search with LSP", "n"),
  map("<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols", "n"),
  group("<leader>m", " Markdown Tools", "n"),
  map("<leader>mp", "<CMD>MarkdownPreviewToggle<CR>", "Start/Stop Preview in default browser", "n"),
  map("<leader>mt", "<cmd>Glow<cr>", "Preview in terminal directly", "n"),
  map("<leader>n", "<cmd>noh<CR>", "Turn off search highlight", "n"),
  group("<leader>o", "+ Portal Jumplist", "n"),
  map("<leader>oi", "<cmd>lua require('portal').jump_forward()<cr>", "Jump forward", "n"),
  map("<leader>om", "<cmd>lua require('portal.mark').toggle()<cr>", "marks jump list", "n"),
  map("<leader>oo", "<cmd>lua require('portal').jump_backward()<cr>", "Jump backward", "n"),
  group("<leader>p", "Lazy Plugins", "n"),
  map("<leader>pc", "<cmd>Lazy check<cr>", "check plugins for available updates", "n"),
  map("<leader>pd", "<cmd>Lazy debug<cr>", "debugging plugins", "n"),
  map("<leader>ph", "<cmd>Lazy help<cr>", "lazy plugin help", "n"),
  map("<leader>pi", "<cmd>Lazy install<cr>", "install the package if a new package is available", "n"),
  map("<leader>pl", "<cmd>Lazy log<cr>", "log plugins last release notes", "n"),
  map("<leader>pp", "<cmd>Lazy profile<cr>", "plugins profile", "n"),
  map("<leader>pr", "<cmd>Lazy restore<cr>", "restore plugins to prior commits", "n"),
  map("<leader>ps", "<cmd>Lazy sync<cr>", "sync packages with git repos", "n"),
  map("<leader>pu", "<cmd>Lazy update<cr>", "update packages", "n"),
  map("<leader>px", "<cmd>Lazy clean<cr>", "clean unused package", "n"),
  map("<leader>q", "<cmd>q!<CR>", "Quit", "n"),
  group("<leader>r", "Format & Replace & Regex ", "n"),
  map("<leader>rf", "<cmd>Format<CR>", "Format File", "n"),
  map("<leader>rp", "<cmd>lua require'regexplainer'.show { display = 'popup' }<CR>", "display Regex pattern in popup", "n"),
  map("<leader>rr", "<cmd>lua require('renamer').rename()<CR>", "rename UI like VS-CODE", "n"),
  map("<leader>rs", "<cmd>lua require'regexplainer'.show { display = 'split' }<CR>", "display Regex pattern in split window", "n"),
  group("<leader>s", "Search", "n"),
  map("<leader>sC", "<cmd>Telescope commands<cr>", "Commands", "n"),
  map("<leader>sM", "<cmd>Telescope man_pages<cr>", "Man Pages", "n"),
  map("<leader>sR", "<cmd>Telescope registers<cr>", "Registers", "n"),
  map("<leader>sb", "<cmd>Telescope git_branches<cr>", "Checkout branch", "n"),
  map("<leader>sc", "<cmd>Telescope colorscheme<cr>", "Colorscheme", "n"),
  map("<leader>sf", "<cmd>Telescope find_files<cr>", "Find File", "n"),
  map("<leader>sg", "<CMD>lua require('spectre').open()<CR>", "Search and replace with rg", "n"),
  map("<leader>sh", "<cmd>Telescope help_tags<cr>", "Find Help", "n"),
  map("<leader>sk", "<cmd>Telescope keymaps<cr>", "Keymaps", "n"),
  map("<leader>sl", "<CMD>lua require('spectre').open_file_search()<CR>", "Search and replace with rg (active buffer set to path)", "n"),
  map("<leader>sp", "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview", "n"),
  map("<leader>sr", "<cmd>Telescope oldfiles<cr>", "Open Recent File", "n"),
  map("<leader>st", "<cmd>Telescope live_grep<cr>", "Text", "n"),
  map("<leader>sw", "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", "Search and replace with rg (select word under cursor)", "n"),
  group("<leader>t", "Float Terminal", "n"),
  map("<leader>tg", "<cmd>Lspsaga open_floaterm gitui<cr>", "Open GitUI", "n"),
  map("<leader>tl", "<cmd>Lspsaga open_floaterm lazygit<cr>", "Open lazygit", "n"),
  map("<leader>tt", "<cmd>Lspsaga open_floaterm<cr>", "Open Terminal", "n"),
  map("<leader>v", "<CMD>NvimContextVtToggle<CR>", "Virtual text by treesitter", "n"),
  group("<leader>w", "Windows Mannager", "n"),
  map("<leader>wm", "<cmd>WinShift<CR>", "Window manipulation", "n"),
  map("<leader>wo", "<cmd>only<CR>", "close other window", "n"),
  map("<leader>wq", "<cmd>quit<CR>", "quit window", "n"),
  map("<leader>ws", "<cmd>sp<CR>", "split window", "n"),
  map("<leader>wv", "<cmd>vsp<CR>", "split window vertical", "n"),
  group("<leader>z", "Spell", "n"),
  map("<leader>zp", "<CMD>normal! mz[s1z=`z<CR>", "pick first suggest in spell checker", "n"),
  map("<leader>zt", "<CMD>set spell!<CR>", "toggle spell checker", "n"),
}

M.visual_mappings = {
  map("<leader>/", "<ESC><CMD>'<,'>lua require('Comment').toggle()<CR>", "Comment", "v"),
  map("<leader>r", "<cmd>lua require('renamer').rename()<CR>", "rename UI like VS-CODE", "v"),
  map("<leader>s", "<ESC><CMD>'<,'>lua require('spectre').open_visual()<CR>", "Search and replace", "v"),
}

return M
