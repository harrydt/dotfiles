return function()
	vim.g.indent_blankline_enabled = true

	vim.g.indent_blankline_char_list = { '|', '¦', '┆', '┊' }
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_show_first_indent_level = false
	vim.g.indent_blankline_filetype_exclude = { 'dashboard' }
	vim.g.indent_blankline_buftype_exclude = { 'terminal' }
end
