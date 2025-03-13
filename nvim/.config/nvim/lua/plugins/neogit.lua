return {
	{
		"NeogitOrg/neogit",
		dependencies = "sindrets/diffview.nvim",
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
		"sindrets/diffview.nvim",
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				keymaps = {
					disable_defaults = true, -- Disable the default keymaps
					view = {
						-- The `view` bindings are active in the diff buffers, only when the current
						-- tabpage is a Diffview.
						{
							"n",
							"<tab>",
							actions.select_next_entry,
							{ desc = "Open the diff for the next file" },
						},
						{
							"n",
							"<s-tab>",
							actions.select_prev_entry,
							{ desc = "Open the diff for the previous file" },
						},
						{
							"n",
							"gf",
							actions.goto_file_edit,
							{ desc = "Open the file in the previous tabpage" },
						},
						{
							"n",
							"<C-w><C-f>",
							actions.goto_file_split,
							{ desc = "Open the file in a new split" },
						},
						{
							"n",
							"<C-w>gf",
							actions.goto_file_tab,
							{ desc = "Open the file in a new tabpage" },
						},
						{
							"n",
							"<localleader>e",
							actions.focus_files,
							{ desc = "Bring focus to the file panel" },
						},
						{
							"n",
							"<localleader>b",
							actions.toggle_files,
							{ desc = "Toggle the file panel." },
						},
						{
							"n",
							"g<C-x>",
							actions.cycle_layout,
							{ desc = "Cycle through available layouts." },
						},
						{
							"n",
							"[x",
							actions.prev_conflict,
							{ desc = "In the merge-tool: jump to the previous conflict" },
						},
						{
							"n",
							"]x",
							actions.next_conflict,
							{ desc = "In the merge-tool: jump to the next conflict" },
						},
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
							"dx",
							actions.conflict_choose("none"),
							{ desc = "Delete the conflict region" },
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
						{
							"n",
							"dX",
							actions.conflict_choose_all("none"),
							{ desc = "Delete the conflict region for the whole file" },
						},
					},
					diff1 = {
						-- Mappings in single window diff layouts
						{ "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
					},
					diff2 = {
						-- Mappings in 2-way diff layouts
						{ "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
					},
					diff3 = {
						-- Mappings in 3-way diff layouts
						{
							{ "n", "x" },
							"2do",
							actions.diffget("ours"),
							{ desc = "Obtain the diff hunk from the OURS version of the file" },
						},
						{
							{ "n", "x" },
							"3do",
							actions.diffget("theirs"),
							{ desc = "Obtain the diff hunk from the THEIRS version of the file" },
						},
						{ "n", "g?", actions.help({ "view", "diff3" }), { desc = "Open the help panel" } },
					},
					diff4 = {
						-- Mappings in 4-way diff layouts
						{
							{ "n", "x" },
							"1do",
							actions.diffget("base"),
							{ desc = "Obtain the diff hunk from the BASE version of the file" },
						},
						{
							{ "n", "x" },
							"2do",
							actions.diffget("ours"),
							{ desc = "Obtain the diff hunk from the OURS version of the file" },
						},
						{
							{ "n", "x" },
							"3do",
							actions.diffget("theirs"),
							{ desc = "Obtain the diff hunk from the THEIRS version of the file" },
						},
						{ "n", "g?", actions.help({ "view", "diff4" }), { desc = "Open the help panel" } },
					},
					file_panel = {
						{
							"n",
							"j",
							actions.next_entry,
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"<down>",
							actions.next_entry,
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"k",
							actions.prev_entry,
							{ desc = "Bring the cursor to the previous file entry" },
						},
						{
							"n",
							"<up>",
							actions.prev_entry,
							{ desc = "Bring the cursor to the previous file entry" },
						},
						{
							"n",
							"<cr>",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry" },
						},
						{
							"n",
							"o",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry" },
						},
						{
							"n",
							"l",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry" },
						},
						{
							"n",
							"<2-LeftMouse>",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry" },
						},
						{
							"n",
							"-",
							actions.toggle_stage_entry,
							{ desc = "Stage / unstage the selected entry" },
						},
						{
							"n",
							"s",
							actions.toggle_stage_entry,
							{ desc = "Stage / unstage the selected entry" },
						},
						{
							"n",
							"S",
							actions.stage_all,
							{ desc = "Stage all entries" },
						},
						{
							"n",
							"U",
							actions.unstage_all,
							{ desc = "Unstage all entries" },
						},
						{
							"n",
							"X",
							actions.restore_entry,
							{ desc = "Restore entry to the state on the left side" },
						},
						{
							"n",
							"L",
							actions.open_commit_log,
							{ desc = "Open the commit log panel" },
						},
						{ "n", "zo", actions.open_fold, { desc = "Expand fold" } },
						{ "n", "h", actions.close_fold, { desc = "Collapse fold" } },
						{ "n", "zc", actions.close_fold, { desc = "Collapse fold" } },
						{ "n", "za", actions.toggle_fold, { desc = "Toggle fold" } },
						{
							"n",
							"zR",
							actions.open_all_folds,
							{ desc = "Expand all folds" },
						},
						{
							"n",
							"zM",
							actions.close_all_folds,
							{ desc = "Collapse all folds" },
						},
						{
							"n",
							"<c-b>",
							actions.scroll_view(-0.25),
							{ desc = "Scroll the view up" },
						},
						{
							"n",
							"<c-f>",
							actions.scroll_view(0.25),
							{ desc = "Scroll the view down" },
						},
						{
							"n",
							"<tab>",
							actions.select_next_entry,
							{ desc = "Open the diff for the next file" },
						},
						{
							"n",
							"<s-tab>",
							actions.select_prev_entry,
							{ desc = "Open the diff for the previous file" },
						},
						{
							"n",
							"gf",
							actions.goto_file_edit,
							{ desc = "Open the file in the previous tabpage" },
						},
						{
							"n",
							"<C-w><C-f>",
							actions.goto_file_split,
							{ desc = "Open the file in a new split" },
						},
						{
							"n",
							"<C-w>gf",
							actions.goto_file_tab,
							{ desc = "Open the file in a new tabpage" },
						},
						{
							"n",
							"i",
							actions.listing_style,
							{ desc = "Toggle between 'list' and 'tree' views" },
						},
						{
							"n",
							"f",
							actions.toggle_flatten_dirs,
							{ desc = "Flatten empty subdirectories in tree listing style" },
						},
						{
							"n",
							"R",
							actions.refresh_files,
							{ desc = "Update stats and entries in the file list" },
						},
						{
							"n",
							"<localleader>e",
							actions.focus_files,
							{ desc = "Bring focus to the file panel" },
						},
						{
							"n",
							"<localleader>b",
							actions.toggle_files,
							{ desc = "Toggle the file panel" },
						},
						{
							"n",
							"g<C-x>",
							actions.cycle_layout,
							{ desc = "Cycle available layouts" },
						},
						{
							"n",
							"[x",
							actions.prev_conflict,
							{ desc = "Go to the previous conflict" },
						},
						{
							"n",
							"]x",
							actions.next_conflict,
							{ desc = "Go to the next conflict" },
						},
						{
							"n",
							"g?",
							actions.help("file_panel"),
							{ desc = "Open the help panel" },
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
						{
							"n",
							"dX",
							actions.conflict_choose_all("none"),
							{ desc = "Delete the conflict region for the whole file" },
						},
					},
					file_history_panel = {
						{
							"n",
							"g!",
							actions.options,
							{ desc = "Open the option panel" },
						},
						{
							"n",
							"<C-A-d>",
							actions.open_in_diffview,
							{ desc = "Open the entry under the cursor in a diffview" },
						},
						{
							"n",
							"y",
							actions.copy_hash,
							{ desc = "Copy the commit hash of the entry under the cursor" },
						},
						{ "n", "L", actions.open_commit_log, { desc = "Show commit details" } },
						{ "n", "zR", actions.open_all_folds, { desc = "Expand all folds" } },
						{ "n", "zM", actions.close_all_folds, { desc = "Collapse all folds" } },
						{
							"n",
							"j",
							actions.next_entry,
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"<down>",
							actions.next_entry,
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"k",
							actions.prev_entry,
							{ desc = "Bring the cursor to the previous file entry." },
						},
						{
							"n",
							"<up>",
							actions.prev_entry,
							{ desc = "Bring the cursor to the previous file entry." },
						},
						{
							"n",
							"<cr>",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry." },
						},
						{
							"n",
							"o",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry." },
						},
						{
							"n",
							"<2-LeftMouse>",
							actions.select_entry,
							{ desc = "Open the diff for the selected entry." },
						},
						{ "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
						{
							"n",
							"<c-f>",
							actions.scroll_view(0.25),
							{ desc = "Scroll the view down" },
						},
						{
							"n",
							"<tab>",
							actions.select_next_entry,
							{ desc = "Open the diff for the next file" },
						},
						{
							"n",
							"<s-tab>",
							actions.select_prev_entry,
							{ desc = "Open the diff for the previous file" },
						},
						{
							"n",
							"gf",
							actions.goto_file_edit,
							{ desc = "Open the file in the previous tabpage" },
						},
						{
							"n",
							"<C-w><C-f>",
							actions.goto_file_split,
							{ desc = "Open the file in a new split" },
						},
						{
							"n",
							"<C-w>gf",
							actions.goto_file_tab,
							{ desc = "Open the file in a new tabpage" },
						},
						{
							"n",
							"<localleader>e",
							actions.focus_files,
							{ desc = "Bring focus to the file panel" },
						},
						{
							"n",
							"<localleader>b",
							actions.toggle_files,
							{ desc = "Toggle the file panel" },
						},
						{
							"n",
							"g<C-x>",
							actions.cycle_layout,
							{ desc = "Cycle available layouts" },
						},
						{ "n", "g?", actions.help("file_history_panel"), { desc = "Open the help panel" } },
					},
					option_panel = {
						{ "n", "<tab>", actions.select_entry, { desc = "Change the current option" } },
						{ "n", "q", actions.close, { desc = "Close the panel" } },
						{ "n", "g?", actions.help("option_panel"), { desc = "Open the help panel" } },
					},
					help_panel = {
						{ "n", "q", actions.close, { desc = "Close help menu" } },
						{ "n", "<esc>", actions.close, { desc = "Close help menu" } },
					},
				},
			})
		end,
		-- cmd = "DiffviewOpen",
	},
}
