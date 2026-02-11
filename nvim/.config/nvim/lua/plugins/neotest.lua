local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"fredrikaverpil/neotest-golang",
			version = "*", -- Optional, but recommended; track releases
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
		{ "rouge8/neotest-rust" },
	},
	config = function()
		local config = {
			runner = "gotestsum", -- Optional, but recommended
			-- go_test_args = "-vet=off warn_test_name_dupes = false", -- Too many duplicate test warnings
			warn_test_name_dupes = false,
		}
		require("neotest").setup({
			adapters = {
				require("neotest-golang")(config),
			},
		})
	end,
}

return M
