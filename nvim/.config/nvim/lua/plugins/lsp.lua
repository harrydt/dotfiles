return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local icons = require("core").icons.diagnostics
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = icons.Error,
						[vim.diagnostic.severity.WARN] = icons.Warn,
						[vim.diagnostic.severity.HINT] = icons.Hint,
						[vim.diagnostic.severity.INFO] = icons.Info,
					},
				},
				virtual_text = { source = "if_many" },
				severity_sort = true,
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			vim.lsp.config("gopls", {
				settings = {
					["gopls"] = {
						buildFlags = { "-tags=integration,standalone" },
						gofumpt = true,
					},
				},
			})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"gopls",
				"lua_ls",
				"yamlls",
				"jsonls",
				-- rust-analyzer is handled by rustaceanvim
			},
		},
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
