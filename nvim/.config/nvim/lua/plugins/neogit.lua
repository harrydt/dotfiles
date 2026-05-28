return {
	{
		"NeogitOrg/neogit",
		dependencies = "dlyongemallo/diffview.nvim",
		config = function()
			require("neogit").setup({
				disable_hint = true,
				disable_insert_on_commit = false,
				disable_commit_confirmation = true,
				signs = {
					-- { CLOSED, OPENED }
					section = { "", "" },
					item = { "", "" },
					hunk = { "", "" },
				},
				integrations = {
					diffview = true,
					telescope = true,
				},
				commit_editor = {
					-- "auto" "vsplit" if window would have 80 cols, otherwise "split"
					kind = "auto",
				},
				graph_style = "kitty",
			})
		end,
		cmd = "Neogit",
	},
	{
		"dlyongemallo/diffview.nvim",
		config = function()
			local actions = require("diffview.actions")

			require("diffview").setup({
				view = {
					merge_tool = {
						layout = "diff4_mixed",
					},
				},
				keymaps = {
					view = {
						-- Prefer <localleader> for Diffview-local actions instead of Diffview's default <leader> maps.
						["<leader>e"] = false,
						["<leader>b"] = false,
						["<leader>co"] = false,
						["<leader>ct"] = false,
						["<leader>cb"] = false,
						["<leader>ca"] = false,
						["<leader>cO"] = false,
						["<leader>cT"] = false,
						["<leader>cB"] = false,
						["<leader>cA"] = false,
						{ "n", "<localleader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<localleader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
						{
							"n",
							"<localleader>co",
							actions.conflict_choose("ours"),
							{ desc = "Choose the OURS version of a conflict" },
						},
						{
							"n",
							"<localleader>ct",
							actions.conflict_choose("theirs"),
							{ desc = "Choose the THEIRS version of a conflict" },
						},
						{
							"n",
							"<localleader>cb",
							actions.conflict_choose("base"),
							{ desc = "Choose the BASE version of a conflict" },
						},
						{
							"n",
							"<localleader>ca",
							actions.conflict_choose("all"),
							{ desc = "Choose all the versions of a conflict" },
						},
						{
							"n",
							"<localleader>cO",
							actions.conflict_choose_all("ours"),
							{ desc = "Choose the OURS version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cT",
							actions.conflict_choose_all("theirs"),
							{ desc = "Choose the THEIRS version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cB",
							actions.conflict_choose_all("base"),
							{ desc = "Choose the BASE version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cA",
							actions.conflict_choose_all("all"),
							{ desc = "Choose all the versions of a conflict for the whole file" },
						},
					},
					file_panel = {
						-- Prefer <localleader> for Diffview-local actions instead of Diffview's default <leader> maps.
						["<leader>e"] = false,
						["<leader>b"] = false,
						["<leader>cO"] = false,
						["<leader>cT"] = false,
						["<leader>cB"] = false,
						["<leader>cA"] = false,
						{ "n", "<localleader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<localleader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
						{
							"n",
							"<localleader>cO",
							actions.conflict_choose_all("ours"),
							{ desc = "Choose the OURS version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cT",
							actions.conflict_choose_all("theirs"),
							{ desc = "Choose the THEIRS version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cB",
							actions.conflict_choose_all("base"),
							{ desc = "Choose the BASE version of a conflict for the whole file" },
						},
						{
							"n",
							"<localleader>cA",
							actions.conflict_choose_all("all"),
							{ desc = "Choose all the versions of a conflict for the whole file" },
						},
					},
					file_history_panel = {
						-- Prefer <localleader> for Diffview-local actions instead of Diffview's default <leader> maps.
						["<leader>e"] = false,
						["<leader>b"] = false,
						{ "n", "<localleader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<localleader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
					},
				},
			})
		end,
	},
}
