return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local parsers = {
				"bash",
				"comment",
				"css",
				"diff",
				"dockerfile",
				"git_config",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"http",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			}

			for _, parser in ipairs(parsers) do
				ts.install(parser)
			end

			local patterns = {}
			for _, parser in ipairs(parsers) do
				local ok, filetypes = pcall(vim.treesitter.language.get_filetypes, parser)
				if ok then
					for _, ft in ipairs(filetypes) do
						table.insert(patterns, ft)
					end
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = patterns,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { { "nvim-treesitter/nvim-treesitter", branch = "main" } },
	},
}
