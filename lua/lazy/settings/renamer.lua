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
