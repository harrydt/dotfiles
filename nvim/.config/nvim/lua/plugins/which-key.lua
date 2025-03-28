local M = {
	"folke/which-key.nvim",
	version = "v2.1.0",
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
		[","] = { "Find buffer" },
		["/"] = { "Grep" },
		[":"] = { "Command history" },
		["b"] = {
			name = "+buffers",
			["c"] = { "Close all buffers" },
			["b"] = { "Switch to other buffer" },
			["d"] = { "Delete current buffer" },
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
			["s"] = { "Sessions" },
		},
		["g"] = {
			name = "+git",
			["o"] = { "Open Neogit" },
			["d"] = {
				name = "+diffview",
				["o"] = { "Open" },
				["c"] = { "Close" },
			},
			["p"] = { "Pull" },
			["P"] = { "Push" },
			["s"] = { "Status" },
			["b"] = { "Blame line" },
			["B"] = { "Branches" },
			["l"] = { "Log" },
			["c"] = { "Commits of buffer" },
			["r"] = { "Open line in Github" },
			["R"] = { "Open file in Github" },
			["a"] = { "Advanced Git search" },
		},
		["l"] = {
			name = "+llm",
			["a"] = { "Actions" },
			["i"] = { "Inline" },
			["t"] = { "Toggle" },
			["A"] = { "Agent" }, -- TODO not setup yet
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
			["b"] = { "In opened buffers" },
			["s"] = { "Symbols" },
			["h"] = { "Command history" },
			["m"] = { "Jump to mark" },
		},
		["w"] = {
			name = "+windows",
			["w"] = { "Other window" },
			["d"] = { "Delete window" },
			["s"] = { "Split window below" },
			["v"] = { "Split window right" },
			["H"] = { "Expand window left" },
			["J"] = { "Expand window below" },
			["L"] = { "Expand window right" },
			["K"] = { "Expand window up" },
			["="] = { "Balance window" },
			["m"] = { "Move windows" },
			["S"] = { "Swap windows" },
			["c"] = { "Center window" },
		},
		-- Organizing
		["o"] = {
			name = "+org",
			["w"] = { "Workspace" },
			["r"] = { "Return" },
		},
	}

	wk.register(mappings, { prefix = "<leader>" })
end

-- Go keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.go",
	callback = function()
		local wk = require("which-key")
		local opts = {
			mode = "n", -- NORMAL mode
			buffer = vim.api.nvim_get_current_buf(), -- Specify a buffer number for buffer local mappings to show only in tex buffers
		}
		local mappings = {
			["<localleader>"] = {
				t = {
					name = "+test",
					f = "Func",
					s = "Func Select",
					F = "File",
					p = "Package",
					a = {
						name = "+add",
						f = "Func",
						e = "Exported Funcs",
						a = "All Funcs",
					},
				},
				T = {
					name = "+tags",
					a = "Add",
					r = "Remove",
				},
				b = {
					name = "+binaries",
					i = "Install",
					u = "Update",
				},
				["c"] = { "Add comment" },
				f = {
					name = "+fill",
					s = "Auto fill struct",
					S = "Fill switch",
					e = "Add if err",
					p = "Fix plurals",
				},
			},
		}

		wk.register(mappings, opts)
	end,
})

-- Rust keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.rs",
	callback = function()
		local wk = require("which-key")
		local opts = {
			mode = "n", -- NORMAL mode
			buffer = vim.api.nvim_get_current_buf(), -- Specify a buffer number for buffer local mappings to show only in tex buffers
		}
		local mappings = {
			["<localleader>"] = {
				["r"] = { "Runnables" },
				["p"] = { "Parent Module" },
				["s"] = { "Structural Search Replace" },
				["e"] = { "Expand Macro" },
			},
		}

		wk.register(mappings, opts)
	end,
})

-- Neorg keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.norg",
	callback = function()
		local wk = require("which-key")
		local opts = {
			mode = "n", -- NORMAL mode
			buffer = vim.api.nvim_get_current_buf(), -- Specify a buffer number for buffer local mappings to show only in tex buffers
		}
		local mappings = {
			["<localleader>"] = {
				[","] = { "Find file" },
				["/"] = { "Grep" },
				["i"] = { "Index" },
				["f"] = {
					name = "+find",
					["f"] = { "Norg files" },
					["l"] = { "Linkables" },
					["i"] = { "Headings" },
				},
				["l"] = {
					name = "+link",
					["l"] = { "Link" },
					["f"] = { "File Link" },
				},
				["j"] = {
					name = "+journal",
					["t"] = "Today",
					["o"] = "Other,",
				},
			},
		}

		wk.register(mappings, opts)
	end,
})

-- git mergetool keymaps
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.opt.diff:get() then
			local wk = require("which-key")
			local opts = {
				mode = "n", -- NORMAL mode
				buffer = vim.api.nvim_get_current_buf(), -- Specify a buffer number for buffer local mappings
			}
			local mappings = {
				["<localleader>"] = {
					["1"] = { ":diffget LOCAL<CR>", "Get LOCAL" },
					["2"] = { ":diffget BASE<CR>", "Get BASE" },
					["3"] = { ":diffget REMOTE<CR>", "Get REMOTE" },
				},
			}

			wk.register(mappings, opts)
		end
	end,
})

return M
