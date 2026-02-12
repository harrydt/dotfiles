-- Drawer mappings
vim.keymap.set("n", "o", "<Plug>(DBUI_SelectLine)", { buffer = true, desc = "Open/Toggle Drawer options" })
vim.keymap.set("n", "<CR>", "<Plug>(DBUI_SelectLine)", { buffer = true, desc = "Open/Toggle Drawer options" })
vim.keymap.set("n", "<localleader>d", "<Plug>(DBUI_DeleteLine)", { buffer = true, desc = "Delete buffer or saved sql" })
vim.keymap.set("n", "<localleader>r", "<Plug>(DBUI_Redraw)", { buffer = true, desc = "Redraw" })
vim.keymap.set("n", "<localleader>a", "<Plug>(DBUI_AddConnection)", { buffer = true, desc = "Add connection" })
vim.keymap.set("n", "<localleader>h", "<Plug>(DBUI_ToggleDetails)", { buffer = true, desc = "Toggle database details" })
vim.keymap.set(
	"n",
	"<localleader>E",
	"<Plug>(DBUI_EditBindParameters)",
	{ buffer = true, desc = "Edit bind parameters" }
)

-- Window
vim.keymap.set(
	"n",
	"<localleader>v",
	"<Plug>(DBUI_SelectLineVsplit)",
	{ buffer = true, desc = "Open in vertical split (override)" }
)
vim.keymap.set(
	"n",
	"<localleader>s",
	"<Plug>(DBUI_SelectLineVsplit)",
	{ buffer = true, desc = "Open in vertical split" }
)

-- C-* remappings to localleader
vim.keymap.set("n", "<localleader>j", "<C-j>", { buffer = true, desc = "Go to last sibling" })
vim.keymap.set("n", "<localleader>k", "<C-k>", { buffer = true, desc = "Go to first sibling" })
vim.keymap.set("n", "<localleader>p", "<C-p>", { buffer = true, desc = "Go to parent node" })
vim.keymap.set("n", "<localleader>n", "<C-n>", { buffer = true, desc = "Go to child node" })
vim.keymap.set("n", "<localleader>]", "<C-]>", { buffer = true, desc = "Go to entry from foreign key cell" })
