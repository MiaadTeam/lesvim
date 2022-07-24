-- Utilities for creating configurations
local util = require("formatter.util")

require("formatter").setup({
	filetype = {
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = {
						"--emit=stdout",
					},
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--config-path ",
						"~/.config/dotfiles/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
		html = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		css = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		-- SAMPLE for prettier
		javascript = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
		javascript = {
			function()
				return {
					exe = "dprint fmt ",
					args = {
						"--config ",
						"~/.config/dotfiles/dprint/dprint.json",
					},
					stdin = false,
				}
			end,
		},
		javascriptreact = {
			function()
				return {
					exe = "dprint fmt ",
					args = {
						"--config ",
						"~/.config/dotfiles/dprint/dprint.json",
					},
					stdin = false,
				}
			end,
		},
		typescript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		typescriptreact = {
			function()
				return {
					exe = "dprint fmt ",
					args = {
						"--config ",
						"~/.config/dotfiles/dprint/dprint.json",
					},
					stdin = false,
				}
			end,
		},
		-- markdown = {
		-- 	function()
		-- 		return {
		-- 			exe = "dprint fmt ",
		-- 			args = {
		-- 				"--config ",
		-- 				"~/.config/dotfiles/dprint/dprint.json",
		-- 			},
		-- 			stdin = false,
		-- 		}
		-- 	end,
		-- },
		-- json = {
		-- 	function()
		-- 		return {
		-- 			exe = "dprint fmt ",
		-- 			args = {
		-- 				"--config ",
		-- 				"~/.config/dotfiles/dprint/dprint.json",
		-- 			},
		-- 			stdin = false,
		-- 		}
		-- 	end,
		-- },
	},
})

-- ~/.config/dotfiles/dprint/dprint.json
-- ~/.config/dotfiles/dprint/dprint.json

-- vim.api.nvim_exec(
-- 	[[
-- augroup Format
--     autocmd!
--     autocmd BufWritePost * FormatWrite
-- augroup END
-- ]],
-- 	true
-- )

-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx FormatWrite
-- augroup END
-- ]],
-- 	true
-- )
--

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
