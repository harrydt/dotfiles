return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = {} },
			{ "mason.nvim", version = "^1.0.0" },
			{ "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
			{
				"hrsh7th/cmp-nvim-lsp",
				-- cond = function()
				-- 	return require("core.utils").has("nvim-cmp")
				-- end,
			},
		},
		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
				},
				severity_sort = true,
			},
			-- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
			-- Be aware that you also will need to properly configure your LSP server to
			-- provide the inlay hints.
			inlay_hints = {
				enabled = false,
			},
			-- add any global capabilities here
			capabilities = {},
			-- Automatically format on save
			autoformat = true,
			-- Enable this to show formatters used in a notification
			-- Useful for debugging formatter issues
			format_notify = false,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				jsonls = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					-- Use this to add any additional keymaps
					-- for specific lsp servers
					---@type LazyKeys[]
					-- keys = {},
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				gopls = {},
				golangci_lint_ls = {},
				rust_analyzer = {},
				pyright = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		---@param opts PluginLspOpts
		config = function(_, opts)
			local Util = require("core.utils")
			-- setup autoformat
			require("plugins.lsp.format").setup(opts)
			-- setup formatting and keymaps
			Util.on_attach(function(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			local register_capability = vim.lsp.handlers["client/registerCapability"]

			vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
				local ret = register_capability(err, res, ctx)
				local client_id = ctx.client_id
				---@type lsp.Client
				local client = vim.lsp.get_client_by_id(client_id)
				local buffer = vim.api.nvim_get_current_buf()
				require("plugins.lsp.keymaps").on_attach(client, buffer)
				return ret
			end

			-- diagnostics
			for name, icon in pairs(require("core").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

			if opts.inlay_hints.enabled and inlay_hint then
				Util.on_attach(function(client, buffer)
					if client.server_capabilities.inlayHintProvider then
						inlay_hint(buffer, true)
					end
				end)
			end

			if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
				opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
					or function(diagnostic)
						local icons = require("core").icons.diagnostics
						for d, icon in pairs(icons) do
							if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
								return icon
							end
						end
					end
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			local servers = opts.servers
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities(),
				opts.capabilities or {}
			)

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			-- get all the servers that are available thourgh mason-lspconfig
			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mslp_servers = {}
			if have_mason then
				all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			if have_mason then
				mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
			end

			if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
				local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
				Util.lsp_disable("tsserver", is_deno)
				Util.lsp_disable("denols", function(root_dir)
					return not is_deno(root_dir)
				end)
			end
			require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup_handlers({
				setup,
				-- Next, you can provide targeted overrides for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				["rust_analyzer"] = function()
					require("rust-tools").setup({
						tools = {
							autoSetHints = true,
							runnables = {
								use_telescope = true,
							},
						},

						-- all the opts to send to nvim-lspconfig
						-- these override the defaults set by rust-tools.nvim
						-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
						server = {
							-- on_attach is a callback called when the language server attachs to the buffer
							-- on_attach = on_attach,
							settings = {
								-- to enable rust-analyzer settings visit:
								-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
								["rust-analyzer"] = {
									-- pass --all-features to cargo
									cargo = {
										features = "all",
									},
									-- enable clippy on save
									checkOnSave = true,
									check = {
										command = "clippy",
										features = "all",
									},
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				["gopls"] = function()
					require("lspconfig").gopls.setup({
						settings = {
							gopls = {
								env = {
									GOFLAGS = "-tags=integration",
								},
							},
						},
					})
				end,
			})
		end,
	},

	-- formatters
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.buf,
				},
				should_attach = function(bufnr)
					local buf_name = vim.api.nvim_buf_get_name(bufnr)
					-- Check if buffer path starts with $HOME/kong
					if buf_name:find(vim.fn.expand("$HOME/kong"), 1, true) then
						-- This is to disable autoformat for kong code
						return false
					end

					return true -- Attach null-ls to all other buffers
				end,
			}
		end,
	},

	-- cmdline tools and lsp servers
	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				-- "flake8",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
