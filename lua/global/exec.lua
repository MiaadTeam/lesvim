-- vim.api.nvim_command([[autocmd BufReadPost * call FindRootDirectory()]])

--Save undo history
-- vim.cmd([[set undofile]])

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Autocmd for toml file completion whit crate plugin for nvim-cmp plugin
vim.api.nvim_exec(
	[[
        autocmd FileType toml lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }
]],
	false
)

-- Map macOS specific keybinds
if vim.fn.has("mac") == 1 then
	MAP("n", "<A-Up>", "<C-Up>", {})
	MAP("n", "<A-Down>", "<C-Down>", {})
	MAP("n", "<A-Left>", "<C-Left>", {})
	MAP("n", "<A-Right>", "<C-Right>", {})
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
