-- lazy.nvim spec
local M = {
	"nvim-neorg/neorg",
	ft = "norg",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-cmp",
		"nvim-lua/plenary.nvim",
		"nvim-neorg/neorg-telescope",
	},
	build = ":Neorg sync-parsers",
	cmd = "Neorg",
}
local plugins = {
	["core.defaults"] = {},
	["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
	["core.integrations.nvim-cmp"] = {},
	["core.concealer"] = { config = { icon_preset = "diamond" } },
	["core.export"] = {},
	["core.keybinds"] = {
		-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
		config = {
			default_keybinds = true,
			neorg_leader = ",",
		},
	},
	["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
	["core.summary"] = {},
	["core.qol.toc"] = {},
	["core.qol.todo_items"] = {},
	["core.looking-glass"] = {},
	["core.presenter"] = { config = { zen_mode = "zen-mode" } },
	["core.journal"] = {
		config = {
			strategy = "flat",
			workspace = "main",
		},
	},
	["core.dirman"] = {
		config = {
			workspaces = {
				main = "~/Dropbox/neorg/main",
			},
		},
	},
	["core.itero"] = {}, -- Fast List/Heading Continuation
	["core.integrations.telescope"] = {},
}
M.opts = {
	load = plugins,
}
return M
