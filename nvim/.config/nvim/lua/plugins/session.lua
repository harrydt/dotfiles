return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("persisted").setup({
			autoload = true, -- automatically load the session for the cwd on Neovim startup
			allowed_dirs = { "~/Git", "~/dotfiles" },
			ignored_dirs = { "~/Dropbox/neorg" },
			---@return boolean
			should_save = function()
				if vim.bo.filetype == "gitcommit" then
					return false
				end
				if vim.opt.diff:get() then
					return false
				end

				return true
			end,
		})
	end,
}
