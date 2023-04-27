return {
	"TimUntersberger/neogit",
	dependencies = "sindrets/diffview.nvim",
	config = function()
		require("neogit").setup({
			disable_hint = true,
			disable_insert_on_commit = false,
			disable_commit_confirmation = true,
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			integrations = {
				diffview = true,
			},
		})
	end,
	cmd = "Neogit",
}
