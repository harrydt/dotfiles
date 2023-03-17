local M = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = { "s1n7ax/nvim-window-picker" },
}

function M.config()
	require("neo-tree").setup({
		keys = {
			{
				"<F3>",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("core.utils").get_root() })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
		},
		window = {
			width = 25,
			mappings = {
				["<space>"] = "none",
				["n"] = {
					"toggle_node",
					nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
				},
				["<2-LeftMouse>"] = "open",
				["o"] = "open",
				["s"] = "open_split",
				["v"] = "open_vsplit",
				-- ["S"] = "split_with_window_picker",
				-- ["s"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				["w"] = "open_with_window_picker",
				["C"] = "close_node",
				["a"] = {
					"add",
					-- some commands may take optional config options, see `:h neo-tree-mappings` for details
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
			},
		},
	})

	require("window-picker").setup()
end

return M
