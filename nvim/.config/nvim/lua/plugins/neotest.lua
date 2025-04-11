local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	config = function()
		local neotest_golang_opts = {}
		require("neotest").setup({
			adapters = {
				require("neotest-golang")(neotest_golang_opts),
			},
		})
	end,
}

return M
