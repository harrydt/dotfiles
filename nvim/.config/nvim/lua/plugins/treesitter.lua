return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		keys = {
			{ "<C-.>", desc = "Increment selection" },
			{ "<C-,>", desc = "Decrement selection", mode = "x" },
		},
		---@type TSConfig
		opts = {
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = "all",
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-.>",
					node_incremental = "<C-.>",
					scope_incremental = "<nop>",
					node_decremental = "<C-,>",
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
