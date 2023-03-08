return {
	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			-- when noice is not enabled, install notify on VeryLazy
			-- local Util = require("lazyvim.util")
			-- if not Util.has("noice.nvim") then
			--   Util.on_very_lazy(function()
			--     vim.notify = require("notify")
			--   end)
			-- end
		end,
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
	},

	-- dashboard
	-- {
	--   "goolord/alpha-nvim",
	--   event = "VimEnter",
	--   opts = function()
	--     local dashboard = require("alpha.themes.dashboard")
	--     local logo = [[
	--     ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
	--     ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
	--     ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
	--     ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
	--     ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
	--     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
	--     ]]
	--
	--     dashboard.section.header.val = vim.split(logo, "\n")
	--     dashboard.section.buttons.val = {
	--       dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	--       dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	--       dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	--       dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
	--       dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
	--       dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
	--       dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
	--       dashboard.button("q", " " .. " Quit", ":qa<CR>"),
	--     }
	--     for _, button in ipairs(dashboard.section.buttons.val) do
	--       button.opts.hl = "AlphaButtons"
	--       button.opts.hl_shortcut = "AlphaShortcut"
	--     end
	--     dashboard.section.footer.opts.hl = "Type"
	--     dashboard.section.header.opts.hl = "AlphaHeader"
	--     dashboard.section.buttons.opts.hl = "AlphaButtons"
	--     dashboard.opts.layout[1].val = 8
	--     return dashboard
	--   end,
	--   config = function(_, dashboard)
	--     -- close Lazy and re-open when the dashboard is ready
	--     if vim.o.filetype == "lazy" then
	--       vim.cmd.close()
	--       vim.api.nvim_create_autocmd("User", {
	--         pattern = "AlphaReady",
	--         callback = function()
	--           require("lazy").show()
	--         end,
	--       })
	--     end
	--
	--     require("alpha").setup(dashboard.opts)
	--
	--     vim.api.nvim_create_autocmd("User", {
	--       pattern = "LazyVimStarted",
	--       callback = function()
	--         local stats = require("lazy").stats()
	--         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	--         dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
	--         pcall(vim.cmd.AlphaRedraw)
	--       end,
	--     })
	--   end,
	-- },

	-- lsp symbol navigation for lualine
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
			require("core.utils").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				icons = require("core").icons.kinds,
			}
		end,
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"karb94/neoscroll.nvim",
		init = function()
			require("neoscroll").setup({
				hide_cursor = false,
			})
		end,
	},
}
