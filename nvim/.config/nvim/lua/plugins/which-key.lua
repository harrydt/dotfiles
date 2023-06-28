local M = {
	"folke/which-key.nvim",
}

function M.config()
	local wk = require("which-key")
	local opts = {
		plugins = { spelling = true },
		window = {
			padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
		},
		layout = {
			height = { min = 1, max = 10 }, -- min and max height of the columns
			spacing = 3,
			align = "left",
		},
		ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
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
			["l"] = {
				name = "+lsp",
				["i"] = { "Lsp info" },
				["d"] = { "Show type definition" },
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
			["h"] = { "Help tags" },
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
			["s"] = { "Sync: Install, clean, and update" },
			["S"] = { "Home: list and and status of plugins" },
			["r"] = { "Restore" },
			["c"] = { "Clean disabled or unused plugins" },
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
			["w"] = { "Workspace" },
			["i"] = { "Index" },
			["g"] = { "Grep" },
			["t"] = { "Table of Contents" },
			["f"] = {
				name = "+Find",
				["f"] = { "Norg files" },
				["l"] = { "Linkables" },
				["i"] = { "Headings" },
			},
			["l"] = {
				name = "+Link",
				["l"] = { "Link" },
				["f"] = { "File Link" },
			},
			["j"] = { "Journal" },
		},
	}

	wk.register(mappings, { prefix = "<leader>" })
end

return M
