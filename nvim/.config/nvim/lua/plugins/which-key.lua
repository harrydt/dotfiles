local M = {
	"folke/which-key.nvim",
}

function M.config()
	local wk = require("which-key")

	wk.setup({
		plugins = { spelling = true },
	})

	wk.add({
		-- Top-level
		{ "<leader>`", desc = "Switch buffer" },
		{ "<leader><space>", desc = "Find file" },
		{ "<leader>.", desc = "Browse files" },
		{ "<leader>,", desc = "Find buffer" },
		{ "<leader>/", desc = "Grep" },
		{ "<leader>:", desc = "Command history" },

		-- Buffers
		{ "<leader>b", group = "buffers" },
		{ "<leader>bc", desc = "Close all buffers" },
		{ "<leader>bb", desc = "Switch to other buffer" },
		{ "<leader>bd", desc = "Delete current buffer" },

		-- Code / LSP
		{ "<leader>c", group = "code" },
		{ "<leader>ca", desc = "Code Actions" },
		{ "<leader>cA", desc = "Source Actions" },
		{ "<leader>cr", desc = "Rename" },
		{ "<leader>ch", desc = "Toggle Inlay Hints" },
		{ "<leader>cd", group = "diagnostic" },
		{ "<leader>cdl", desc = "Show line diagnostics" },
		{ "<leader>cdd", desc = "Show document diagnostics" },
		{ "<leader>cdw", desc = "Show workspace diagnostics" },
		{ "<leader>cl", group = "lsp" },
		{ "<leader>cli", desc = "Lsp info" },
		{ "<leader>cld", desc = "Show type definition" },

		-- Find
		{ "<leader>f", group = "find" },
		{ "<leader>ff", desc = "Find files" },
		{ "<leader>ft", desc = "Help tags" },
		{ "<leader>fr", desc = "Recently opened files" },
		{ "<leader>fs", desc = "Sessions" },

		-- Git
		{ "<leader>g", group = "git" },
		{ "<leader>go", desc = "Open Neogit" },
		{ "<leader>gd", group = "diffview" },
		{ "<leader>gdo", desc = "Open (compare against HEAD)" },
		{ "<leader>gdf", desc = "Repo history" },
		{ "<leader>gdh", desc = "File history" },
		{ "<leader>gdm", desc = "Compare against merge base" },
		{ "<leader>gdM", desc = "Compare against remote main/master" },
		{ "<leader>gdc", desc = "Close" },
		{ "<leader>gp", desc = "Pull" },
		{ "<leader>gP", desc = "Push" },
		{ "<leader>gs", desc = "Status" },
		{ "<leader>gb", desc = "Blame line" },
		{ "<leader>gB", desc = "Branches" },
		{ "<leader>gl", desc = "Log" },
		{ "<leader>gc", desc = "Commits of buffer" },
		{ "<leader>gr", desc = "Open line in Github" },
		{ "<leader>gR", desc = "Open file in Github" },
		{ "<leader>ga", desc = "Advanced Git search" },

		-- Httpie
		{ "<leader>h", group = "httpie" },
		{ "<leader>hn", group = "New collection" },
		{ "<leader>ho", desc = "Open collection" },
		{ "<leader>hc", desc = "Close buffer" },

		-- LLM
		{ "<leader>l", group = "llm" },
		{ "<leader>la", desc = "Actions" },
		{ "<leader>li", desc = "Inline" },
		{ "<leader>lt", desc = "Toggle" },
		{ "<leader>lA", desc = "Agent" },

		-- Plugins
		{ "<leader>p", group = "plugins" },
		{ "<leader>ps", desc = "Sync: Install, clean, and update" },
		{ "<leader>pS", desc = "Home: list and status of plugins" },
		{ "<leader>pr", desc = "Restore" },
		{ "<leader>pc", desc = "Clean disabled or unused plugins" },

		-- Quit / Sessions
		{ "<leader>q", group = "quit/sessions" },
		{ "<leader>qq", desc = "Quit window" },
		{ "<leader>qa", desc = "Quit all" },

		-- Search
		{ "<leader>s", group = "search" },
		{ "<leader>sg", desc = "Grep" },
		{ "<leader>sb", desc = "In opened buffers" },
		{ "<leader>ss", desc = "Symbols" },
		{ "<leader>sh", desc = "Command history" },
		{ "<leader>sm", desc = "Jump to mark" },

		-- Test
		{ "<leader>t", group = "test" },
		{ "<leader>tt", desc = "Run nearest test" },
		{ "<leader>tf", desc = "Run tests in file" },
		{ "<leader>to", desc = "Output of test result" },
		{ "<leader>tO", desc = "Output panel of all tests" },
		{ "<leader>ts", desc = "Test summary" },

		-- Windows
		{ "<leader>w", group = "windows" },
		{ "<leader>ww", desc = "Other window" },
		{ "<leader>wd", desc = "Delete window" },
		{ "<leader>ws", desc = "Split window below" },
		{ "<leader>wv", desc = "Split window right" },
		{ "<leader>wH", desc = "Expand window left" },
		{ "<leader>wJ", desc = "Expand window below" },
		{ "<leader>wL", desc = "Expand window right" },
		{ "<leader>wK", desc = "Expand window up" },
		{ "<leader>w=", desc = "Balance window" },
		{ "<leader>wm", desc = "Move windows" },
		{ "<leader>wS", desc = "Swap windows" },
		{ "<leader>wc", desc = "Center window" },

		-- Org
		{ "<leader>o", group = "org" },
		{ "<leader>ow", desc = "Workspace" },
		{ "<leader>or", desc = "Return" },
	})
end

-- Go keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.go",
	callback = function()
		local wk = require("which-key")
		local buf = vim.api.nvim_get_current_buf()
		wk.add({
			{ "<localleader>t", group = "test", buffer = buf },
			{ "<localleader>tf", desc = "Func", buffer = buf },
			{ "<localleader>ts", desc = "Func Select", buffer = buf },
			{ "<localleader>tF", desc = "File", buffer = buf },
			{ "<localleader>tp", desc = "Package", buffer = buf },
			{ "<localleader>ta", group = "add", buffer = buf },
			{ "<localleader>taf", desc = "Func", buffer = buf },
			{ "<localleader>tae", desc = "Exported Funcs", buffer = buf },
			{ "<localleader>taa", desc = "All Funcs", buffer = buf },
			{ "<localleader>T", group = "tags", buffer = buf },
			{ "<localleader>Ta", desc = "Add", buffer = buf },
			{ "<localleader>Tr", desc = "Remove", buffer = buf },
			{ "<localleader>b", group = "binaries", buffer = buf },
			{ "<localleader>bi", desc = "Install", buffer = buf },
			{ "<localleader>bu", desc = "Update", buffer = buf },
			{ "<localleader>c", desc = "Add comment", buffer = buf },
			{ "<localleader>f", group = "fill", buffer = buf },
			{ "<localleader>fs", desc = "Auto fill struct", buffer = buf },
			{ "<localleader>fS", desc = "Fill switch", buffer = buf },
			{ "<localleader>fe", desc = "Add if err", buffer = buf },
			{ "<localleader>fp", desc = "Fix plurals", buffer = buf },
		})
	end,
})

-- Rust keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.rs",
	callback = function()
		local wk = require("which-key")
		local buf = vim.api.nvim_get_current_buf()
		wk.add({
			{ "<localleader>r", desc = "Runnables", buffer = buf },
			{ "<localleader>p", desc = "Parent Module", buffer = buf },
			{ "<localleader>s", desc = "Structural Search Replace", buffer = buf },
			{ "<localleader>e", desc = "Expand Macro", buffer = buf },
		})
	end,
})

-- Httpie keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.http",
	callback = function()
		local wk = require("which-key")
		local buf = vim.api.nvim_get_current_buf()
		wk.add({
			{ "<localleader>r", desc = "Run request", buffer = buf },
			{ "<localleader>n", desc = "New collection", buffer = buf },
			{ "<localleader>s", desc = "Save to collection", buffer = buf },
			{ "<localleader>i", desc = "Import httpie command", buffer = buf, mode = "v" },
			{ "<localleader>e", desc = "Export as httpie command", buffer = buf },
		})
	end,
})

-- Neorg keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.norg",
	callback = function()
		local wk = require("which-key")
		local buf = vim.api.nvim_get_current_buf()
		wk.add({
			{ "<localleader>,", desc = "Find file", buffer = buf },
			{ "<localleader>/", desc = "Grep", buffer = buf },
			{ "<localleader>i", desc = "Index", buffer = buf },
			{ "<localleader>f", group = "find", buffer = buf },
			{ "<localleader>ff", desc = "Norg files", buffer = buf },
			{ "<localleader>fl", desc = "Linkables", buffer = buf },
			{ "<localleader>fi", desc = "Headings", buffer = buf },
			{ "<localleader>l", group = "link", buffer = buf },
			{ "<localleader>ll", desc = "Link", buffer = buf },
			{ "<localleader>lf", desc = "File Link", buffer = buf },
			{ "<localleader>j", group = "journal", buffer = buf },
			{ "<localleader>jt", desc = "Today", buffer = buf },
			{ "<localleader>jo", desc = "Other", buffer = buf },
		})
	end,
})

-- Diff mode keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.opt.diff:get() then
			local wk = require("which-key")
			local buf = vim.api.nvim_get_current_buf()
			wk.add({
				{ "<localleader>1", desc = "Get LOCAL", buffer = buf },
				{ "<localleader>2", desc = "Get BASE", buffer = buf },
				{ "<localleader>3", desc = "Get REMOTE", buffer = buf },
			})
		end
	end,
})

-- Diffview keymaps
vim.api.nvim_create_autocmd("User", {
	pattern = { "DiffviewViewOpened", "DiffviewDiffBufRead", "DiffviewDiffBufWinEnter" },
	callback = function()
		local wk = require("which-key")

		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			wk.add({
				{ "<localleader>c", group = "Conflict", buffer = vim.api.nvim_win_get_buf(win) },
			})
		end
	end,
})

return M
