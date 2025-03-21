return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
			"tpope/vim-unimpaired", -- some useful ]* and [* keymappings
		},
	},
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "tpope/vim-surround" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-autopairs", config = true }, -- See `config` under https://github.com/folke/lazy.nvim#-plugin-spec
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "kevinhwang91/nvim-bqf" },
	{ "simrat39/rust-tools.nvim" },
	{ "sindrets/winshift.nvim" },
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
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
}
