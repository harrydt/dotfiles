local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "<localleader>r", "<cmd>RustLsp runnables<CR>", opts)
utils.map("n", "<localleader>p", "<cmd>RustLsp parentModule<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>RustLsp ssr<CR>", opts)
utils.map("n", "<localleader>e", "<cmd>RustLsp expandMacro<CR>", opts)
utils.map("n", "<localleader>c", "<cmd>RustLsp codeAction<CR>", opts)
utils.map("n", "<localleader>d", "<cmd>RustLsp debuggables<CR>", opts)
utils.map("n", "<localleader>E", "<cmd>RustLsp explainError<CR>", opts)

vim.api.nvim_create_autocmd("LspAttach", {
	buffer = 0,
	callback = function()
		local buf_opts = vim.tbl_extend("force", opts, { buffer = 0 })
		vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", buf_opts)
		vim.keymap.set("n", "J", "<cmd>RustLsp joinLines<CR>", buf_opts)
	end,
})
