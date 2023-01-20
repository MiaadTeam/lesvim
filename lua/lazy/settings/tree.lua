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
