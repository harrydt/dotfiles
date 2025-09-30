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
			"nvim-neorg/neorg-telescope",
			"benlubas/neorg-interim-ls",
		},
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = { config = { icon_preset = "basic" } },
					["core.completion"] = {
						config = { engine = { module_name = "external.lsp-completion" } },
					},
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
					["external.interim-ls"] = {
						config = {
							-- default config shown
							completion_provider = {
								-- Enable or disable the completion provider
								enable = true,

								-- Show file contents as documentation when you complete a file name
								documentation = true,

								-- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
								categories = false,

								-- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
								-- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
								people = {
									enable = false,

									-- path to the file you're like to use with the `{@x` syntax, relative to the
									-- workspace root, without the `.norg` at the end.
									-- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
									-- Note that this will change with your workspace, so it fails silently if the file
									-- doesn't exist
									path = "people",
								},
							},
						},
					},
				},
			})
		end,
	},
}

return M
