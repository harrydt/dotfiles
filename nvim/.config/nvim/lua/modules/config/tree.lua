return function()
	-----------------------------------------------
	-- Empty by default
	-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__" }

	-- False by default, this option shows indent markers when folders are open
	-- vim.g.nvim_tree_indent_markers = 1

	-- False by default, will enable file highlight for git attributes (can be used without the icons).
	vim.g.nvim_tree_git_hl = 1

	-- This is the default. See :help filename-modifiers for more options
	vim.g.nvim_tree_root_folder_modifier = ":~"

	-- False by default, append a trailing slash to folder names
	vim.g.nvim_tree_add_trailing = 1

	-- False by default, compact folders that only contain a single folder into one node in the file tree
	vim.g.nvim_tree_group_empty = 1

	-- 1000 by default, control how often the tree can be refreshed,
	-- 1000 means the tree can be refresh once per 1000ms.
	vim.g.nvim_tree_refresh_wait = 500

	-- List of filenames that gets highlighted with NvimTreeSpecialFile
	vim.g.nvim_tree_special_files = { ["README.md"] = 1, Makefile = 1, MAKEFILE = 1 }

	-- If false, do not show the icons for one of 'git' 'folder' and 'files'
	-- true by default, notice that if 'files' is 1, it will only display
	-- if nvim-web-devicons is installed and on your runtimepath
	vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0 }

	--- Tree icons
	-- default will show icon by default if no icon is provided
	-- default shows no icon by default
	vim.g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "",
			staged = "",
			unmerged = "",
			renamed = "",
			untracked = "",
			deleted = "",
			ignored = "◌",
		},
		folder = {
			arrow_open = "",
			arrow_closed = "",
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = "",
		},
		lsp = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	}

	----- SETUP CONFIGURATION ---------------------
	-----------------------------------------------
	require("nvim-tree").setup({
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					none = "  ",
				},
			},
			icons = {
				webdev_colors = true,
			},
		},
		-- show lsp diagnostics in the signcolumn
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			-- width of the window, can be either a number (columns) or a string in `%`
			width = 25,
			-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
			side = "left",
			-- if true the tree will resize itself after opening a file
			-- auto_resize = true, -- DEPRECATED? So many DEPRECATED...
			mappings = {
				-- custom only false will merge the list with the default mappings
				-- if true, it will only use your list to set the mappings
				custom_only = false,
				list = {}
			},
		},
	})
end
