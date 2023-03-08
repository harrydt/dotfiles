return {
	"vimwiki/vimwiki",
	config = function()
		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
}
