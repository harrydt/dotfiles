--[[ local colorscheme = 'darkplus'

pcall(function()
    vim.cmd('colorscheme ' .. colorscheme)
end) ]]

-- doom-one
vim.api.nvim_command('colorscheme doom-one')
-- Set doom-one colorscheme settings
vim.g.doom_one_cursor_coloring = true
vim.g.doom_one_enable_treesitter = true
vim.g.doom_one_italic_comments = true
vim.g.doom_one_telescope_highlights = true
vim.g.doom_one_terminal_colors = true
vim.g.doom_one_transparent_background = false
