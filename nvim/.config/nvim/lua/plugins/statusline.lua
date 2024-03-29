local M = {
	"NTBBloodbath/galaxyline.nvim",
	event = "BufWinEnter",
}

function M.config()
	local colors = require("galaxyline.themes.colors").get_color

	local bo = vim.bo
	local gl = require("galaxyline")
	local lsp = require("galaxyline.providers.lsp")
	local buffer = require("galaxyline.providers.buffer")
	local condition = require("galaxyline.condition")

	local gls = gl.section

	-- Left side
	gls.left[1] = {
		RainbowLeft = {
			provider = function()
				return "▊ "
			end,
			highlight = { colors("blue"), colors("bg") },
		},
	}
	gls.left[2] = {
		ViMode = {
			provider = function()
				-- auto change color according the vim mode
				-- TODO: find a less dirty way to set ViMode colors
				local mode_color = {
					n = colors("red"),
					i = colors("green"),
					v = colors("blue"),
					[""] = colors("blue"),
					V = colors("blue"),
					c = colors("magenta"),
					no = colors("red"),
					s = colors("orange"),
					S = colors("orange"),
					[""] = colors("orange"),
					ic = colors("yellow"),
					R = colors("magenta"),
					Rv = colors("magenta"),
					cv = colors("red"),
					ce = colors("red"),
					r = colors("cyan"),
					rm = colors("cyan"),
					["r?"] = colors("cyan"),
					["!"] = colors("red"),
					t = colors("red"),
				}
				vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()]())
				return "  "
			end,
			highlight = { colors("red"), colors("bg"), "bold" },
		},
	}
	gls.left[3] = {
		FileIcon = {
			provider = "FileIcon",
			condition = condition.buffer_not_empty and is_not_dashboard,
			highlight = {
				require("galaxyline.providers.fileinfo").get_file_icon_color,
				colors("bg"),
			},
		},
	}
	gls.left[4] = {
		FileName = {
			provider = "FileName",
			condition = condition.buffer_not_empty and is_not_dashboard,
			highlight = { colors("fg"), colors("bg"), "bold" },
			separator = " ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.left[5] = {
		LineInfo = {
			provider = function()
				local line = vim.fn.line(".")
				local column = vim.fn.col(".")
				return string.format("%3d : %2d  ", line, column)
			end,
			condition = is_not_dashboard,
			highlight = { colors("fg_alt"), colors("bg") },
		},
	}
	gls.left[6] = {
		LinePercent = {
			provider = "LinePercent",
			condition = is_not_dashboard,
			highlight = { colors("fg_alt"), colors("bg") },
			separator = "  ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.left[7] = {
		DiagnosticError = {
			provider = "DiagnosticError",
			condition = is_not_dashboard,
			icon = " ",
			highlight = { colors("red"), colors("bg") },
		},
	}
	gls.left[8] = {
		DiagnosticWarn = {
			provider = "DiagnosticWarn",
			condition = is_not_dashboard,
			icon = " ",
			highlight = { colors("orange"), colors("bg") },
		},
	}
	gls.left[9] = {
		DiagnosticInfo = {
			provider = "DiagnosticInfo",
			condition = is_not_dashboard,
			icon = "",
			highlight = { colors("blue"), colors("bg") },
		},
	}

	-- Right side
	-- alternate separator colors if the current buffer is a dashboard
	gls.right[1] = {
		FileFormat = {
			provider = "FileFormat",
			condition = condition.hide_in_width and is_not_dashboard,
			highlight = { colors("fg"), colors("bg") },
			separator = "  ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.right[2] = {
		FileEncode = {
			provider = "FileEncode",
			condition = condition.hide_in_width and is_not_dashboard,
			highlight = { colors("fg"), colors("bg") },
			separator = " ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.right[3] = {
		ShowLspClientOrFileType = {
			provider = function()
				-- Check if there's a LSP client running to avoid redundant
				-- statusline elements
				if lsp.get_lsp_client() ~= "No Active Lsp" then
					return " " .. lsp.get_lsp_client("", { "null-ls" })
				else
					-- Use the filetype instead and capitalize it
					return " " .. vim.bo.filetype
				end
			end,
			condition = function()
				local tbl = { ["dashboard"] = true, [""] = true }
				if tbl[bo.filetype] then
					return false
				end
				return true
			end,
			highlight = { colors("blue"), colors("bg") },
			separator = "  ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.right[4] = {
		GitIcon = {
			provider = function()
				return "  "
			end,
			condition = condition.check_git_workspace,
			highlight = { colors("red"), colors("bg") },
			separator = " ",
			separator_highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.right[5] = {
		GitBranch = {
			provider = "GitBranch",
			condition = condition.check_git_workspace,
			highlight = { colors("green"), colors("bg"), "bold" },
		},
	}
	gls.right[6] = {
		DiffSeparator = {
			provider = function()
				return "   "
			end,
			condition = is_not_dashboard,
			highlight = { colors("bg"), colors("bg") },
		},
	}
	gls.right[7] = {
		DiffAdd = {
			provider = "DiffAdd",
			condition = condition.hide_in_width and is_not_dashboard,
			icon = " ",
			highlight = { colors("green"), colors("bg") },
		},
	}
	gls.right[8] = {
		DiffModified = {
			provider = "DiffModified",
			condition = condition.hide_in_width and is_not_dashboard,
			icon = " ",
			highlight = { colors("orange"), colors("bg") },
		},
	}
	gls.right[9] = {
		DiffRemove = {
			provider = "DiffRemove",
			condition = condition.hide_in_width and is_not_dashboard,
			icon = " ",
			highlight = { colors("red"), colors("bg") },
		},
	}

	gls.right[10] = {
		RainbowRight = {
			provider = function()
				return " ▊"
			end,
			highlight = { colors("blue"), colors("bg") },
		},
	}
end

return M
