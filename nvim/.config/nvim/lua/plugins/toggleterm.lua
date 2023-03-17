return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<F4>]],
			direction = "horizontal",
			float_opts = {
				border = "curved",
				width = 70,
				height = 20,
				winblend = 0,
				highlights = {
					border = "Special",
					background = "Normal",
				},
			},
		})
	end,
}
