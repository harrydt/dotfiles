return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<F4>]],
			direction = "vertical",
			size = vim.o.columns * 0.45,
		})
	end,
}
