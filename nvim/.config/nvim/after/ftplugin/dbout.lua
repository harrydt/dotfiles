-- Operator pending mapping for cell value
vim.keymap.set("o", "ic", "<Plug>(DBUI_CellValue)", { buffer = true, desc = "Select cell value" })
vim.keymap.set("x", "ic", "<Plug>(DBUI_CellValue)", { buffer = true, desc = "Select cell value" })

vim.keymap.set(
	"n",
	"<localleader>]",
	"<Plug>(DBUI_JumpToForeignKey)",
	{ buffer = true, desc = "Go to entry from foreign key cell" }
)
vim.keymap.set(
	"n",
	"<localleader>r",
	"<Plug>(DBUI_ToggleResultLayout)",
	{ buffer = true, desc = "Toggle expanded view in the results buffer" }
)
