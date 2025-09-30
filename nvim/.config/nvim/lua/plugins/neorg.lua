-- lazy.nvim spec
local M = {
	-- {
	-- 	"vhyrro/luarocks.nvim",
	-- 	priority = 1000, -- We'd like this plugin to load first out of the rest
	-- 	config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	-- },
	{
		"nvim-neorg/neorg",
		dependencies = {
			{ "nvim-neorg/neorg-telescope" },
		},
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					-- ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					-- ["core.integrations.nvim-cmp"] = {},
					["core.concealer"] = { config = { icon_preset = "basic" } },
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
				},
			})
		end,
	},
}

return M
