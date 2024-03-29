local function augroup(name)
	return vim.api.nvim_create_augroup("my_augroup_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query", -- :InspectTree
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"fugitiveblame",
		"git",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Get treesitter highlight for Gitcommit filetype
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("neogit-additions"),
	pattern = "NeogitCommitMessage",
	command = "silent! set filetype=gitcommit",
})

local toggle_options = vim.api.nvim_create_augroup("ToggleOptions", { clear = true })

vim.api.nvim_create_autocmd("WinLeave", {
	group = toggle_options,
	desc = "unset cursorline",
	command = "lua vim.opt.cursorline = false",
})

vim.api.nvim_create_autocmd("WinEnter", {
	group = toggle_options,
	desc = "set cursorline",
	command = "lua vim.opt.cursorline = true",
})
