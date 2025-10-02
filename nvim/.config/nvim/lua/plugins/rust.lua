return {
	"mrcjkb/rustaceanvim",
	version = "^6", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			server = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = "all",
						},
						checkOnSave = true,
						check = {
							command = "clippy",
							features = "all",
						},
					},
				},
			},
			tools = {
				inlay_hints = {
					auto = true, -- Automatically show inlay hints (virtual text)
					only_current_line = false, -- Show hints for all lines
					show_parameter_hints = true, -- Show parameter hints
					show_variable_name = true, -- Show variable name hints
				},
			},
		}
	end,
}
