return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		local persisted = require("persisted")
		local utils = require("persisted.utils")
		local allowed_dirs = { "~/Git", "~/dotfiles", "~/kong" }
		local ignored_dirs = { "~/Dropbox/neorg" }
		persisted.setup({
			autoload = true,
			should_save = function()
				if vim.bo.filetype == "gitcommit" then
					return false
				end
				if vim.bo.filetype == "man" then
					return false
				end
				if vim.opt.diff:get() then
					return false
				end
				if utils.dirs_match(vim.fn.getcwd(), ignored_dirs) then
					return false
				end
				if utils.dirs_match(vim.fn.getcwd(), allowed_dirs) then
					return true
				end

				return false
			end,
		})
	end,
}
