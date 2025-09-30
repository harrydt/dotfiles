return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
			"tpope/vim-unimpaired", -- some useful ]* and [* keymappings
		},
	},
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-autopairs", config = true }, -- See `config` under https://github.com/folke/lazy.nvim#-plugin-spec
	{ "kevinhwang91/nvim-bqf" },
	{ "sindrets/winshift.nvim" },
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		config = function()
			require("no-neck-pain").setup({
				width = 150,
				-- Avoid mapping conflicts
				mappings = {},
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
