local colorschema = "tokyonight"

local function setTokyo()
	-- vim.g.tokyonight_style = "night"
	vim.g.tokyonight_italic_functions = true
	vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

	vim.cmd([[colorscheme tokyonight]])
end

local status_ok, _ = pcall(setTokyo)

if not status_ok then
	print("Failed to set colorschema tokyonight")
end
