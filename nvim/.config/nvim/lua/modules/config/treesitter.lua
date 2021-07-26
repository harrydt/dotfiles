return function()
    require('nvim-treesitter.configs').setup({
		ensure_installed = 'maintained',
		highlight = { enable = true },
		-- autopairs = {
			-- enable = functions.is_plugin_disabled('autopairs') and false or true,
		-- },
		indent = { enable = true },
	})
end
