local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	cmd = { "Telescope", "Tel" }, -- lazy loads on these commands
}

function M.config()
	local telescope = require("telescope")
	telescope.setup({
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--trim", -- remove indentation
			},
		},
		pickers = {
			find_files = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			},
		},

		telescope.load_extension("fzf"),
		telescope.load_extension("file_browser"),
		require("telescope").load_extension("persisted"),
	})
end

return M
