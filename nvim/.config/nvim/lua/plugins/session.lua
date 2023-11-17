return {
	"olimorris/persisted.nvim",
	config = function()
		require("persisted").setup({
			autoload = true, -- automatically load the session for the cwd on Neovim startup
			allowed_dirs = { "~/Git", "~/dotfiles" },
		})
	end,
}
