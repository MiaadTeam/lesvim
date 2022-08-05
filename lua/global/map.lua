--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Set colorscheme (order is important here)
vim.o.termguicolors = true

-- it's a snippet from project.nvim which force to nvim tree to corrct cd
vim.g.respect_buf_cwd = 1
--Set statusbar
-- vim.g.lightline = {
-- 	colorscheme = "onedark",
-- 	active = { left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } } },
-- 	component_function = { gitbranch = "fugitive#head" },
-- }
--

-- -- Gitsigns
-- require("gitsigns").setup({
-- 	signs = {
-- 		add = { hl = "GitGutterAdd", text = "+" },
-- 		change = { hl = "GitGutterChange", text = "~" },
-- 		delete = { hl = "GitGutterDelete", text = "_" },
-- 		topdelete = { hl = "GitGutterDelete", text = "‾" },
-- 		changedelete = { hl = "GitGutterChange", text = "~" },
-- 	},
-- })

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })
