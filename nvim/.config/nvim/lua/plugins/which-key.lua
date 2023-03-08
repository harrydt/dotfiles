local M = {
	"folke/which-key.nvim",
}

function M.config()
	local wk = require("which-key")
	local opts = {
		plugins = { spelling = true },
	}
	wk.setup(opts)

	----- Whichkey binds ------------------------
	---------------------------------------------
	local mappings = {
		["`"] = { "Switch buffer" },
		[" "] = { "Find file" },
		["."] = { "Browse files" },
		[","] = { "Switch buffer" },
		["/"] = { "Search a word" },
		[":"] = { "Command history" },
		["b"] = {
			name = "+buffers",
			["c"] = { "Clear all buffers" },
			["f"] = { "Format buffer" },
			["b"] = { "Switch to other buffer" },
			["d"] = { "Delete buffer" },
			["]"] = { "Next buffer" },
			["n"] = { "Next buffer" },
			["g"] = { "Goto buffer" },
			["["] = { "Previous buffer" },
			["p"] = { "Previous buffer" },
		},
		["c"] = {
			name = "+code",
			a = { "Actions" },
			d = {
				name = "+diagnostic",
				["l"] = { "Show line diagnostics" },
				["d"] = { "Show document diagnostics" },
				["w"] = { "Show workspace diagnostics" },
			},
			r = { "Rename" },
			--[[ i = { 'Start a REPL' },
			b = { 'Compile project' },
			c = { 'Compile and run project' }, ]]
			--[[ ['h'] = {
				'Run restclient on the line that the cursor is currently on',
			}, ]]

			["l"] = {
				name = "+lsp",
				["i"] = { "Lsp info" },
				["d"] = { "Show type definition" },
				-- ['l'] = { 'Show line diagnostics' },
				-- ['L'] = { 'Diagnostics into location list' },
			},
		},
		-- change this to debug later maybe?
		--[[ ['d'] = {
			name = '+doom',
			['c'] = { 'Edit your Doom Nvim configuration' },
			['d'] = { 'Open Doom Nvim documentation' },
			['u'] = { 'Update Doom Nvim' },
			['r'] = { 'Rollback Doom Nvim version' },
			['R'] = { 'Create crash report' },
			['s'] = { 'Change colorscheme' },
		}, ]]
		["f"] = {
			name = "+find",
			["f"] = { "Find files" },
			["t"] = { "Help tags" },
			["r"] = { "Recently opened files" },
		},
		["g"] = {
			name = "+git",
			["o"] = { "Open Neogit" },
			["p"] = { "Pull" },
			["P"] = { "Push" },
			["s"] = { "Status" },
			["b"] = { "Blame line" },
			["B"] = { "Branches" },
			["l"] = { "Log" },
			["c"] = { "Commits of buffer" },
			["f"] = { "Open file in Github" },
			["r"] = { "Open repo in Github" },
		},
		["p"] = {
			name = "+plugins",
			["c"] = { "Clean disabled or unused plugins" },
			["C"] = { "Compile your plugins changes" },
			["i"] = { "Install missing plugins" },
			["p"] = { "Profile the time taken loading your plugins" },
			["s"] = { "Sync your plugins" },
			["S"] = { "Plugins status" },
			["u"] = { "Update plugins" },
		},
		["q"] = {
			name = "+quit/sessions",
			["q"] = { "Quit window" },
			["a"] = { "Quit all" },
		},
		["s"] = {
			name = "+search",
			["g"] = { "Grep" },
			["b"] = { "Buffer" },
			["s"] = { "Goto symbol" },
			["h"] = { "Command history" },
			["m"] = { "Jump to mark" },
		},
		["w"] = {
			name = "+windows",
			["w"] = { "Other window" },
			["d"] = { "Delete window" },
			["s"] = { "Split window below" },
			["v"] = { "Split window right" },
			["2"] = { "Layout double columns" },
			["h"] = { "Window left" },
			["j"] = { "Window below" },
			["l"] = { "Window right" },
			["k"] = { "Window up" },
			["H"] = { "Expand window left" },
			["J"] = { "Expand window below" },
			["L"] = { "Expand window right" },
			["K"] = { "Expand window up" },
			["="] = { "Balance window" },
		},
		-- Organizing
		["o"] = {
			name = "+org",
			["i"] = { "Index" },
			["s"] = { "Search" },
			["d"] = {
				name = "+diary",
				["n"] = { "New" },
				["i"] = { "Index" },
				["g"] = { "Generate links" },
			},
			["a"] = {
				name = "+actions",
				["d"] = { "Delete file" },
				["r"] = { "Rename file" },
			},
		},
	}

	wk.register(mappings, { prefix = "<leader>" })
end

return M
