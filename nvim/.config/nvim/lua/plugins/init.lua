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
	{ "numToStr/Comment.nvim", config = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "kevinhwang91/nvim-bqf" },
	{ "simrat39/rust-tools.nvim" },
	{ "sindrets/winshift.nvim" },
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
}
