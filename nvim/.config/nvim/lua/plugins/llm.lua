local M = {
	{
		"olimorris/codecompanion.nvim",
		version = "v17.33.0", -- avoid breaking changes in v18
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
			{
				"zbirenbaum/copilot.lua",
				dependencies = {
					"copilotlsp-nvim/copilot-lsp",
				},
				cmd = "Copilot",
				event = "InsertEnter",
				config = function()
					require("copilot").setup({
						suggestion = { enabled = false },
						panel = { enabled = false },
						filetypes = {
							markdown = true,
							help = true,
						},
					})
				end,
			},
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
						keymaps = {
							accept_change = {
								modes = { n = "ga" },
								description = "Accept the suggested change",
							},
							reject_change = {
								modes = { n = "gr" },
								description = "Reject the suggested change",
							},
						},
					},
					agent = {
						adapter = "copilot",
					},
				},
				ignore_warnings = true, -- TODO remove once upgrade to v18
			})
		end,
	},
}

return M
