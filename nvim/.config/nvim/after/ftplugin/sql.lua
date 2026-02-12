vim.keymap.set(
	"n",
	"<localleader>e",
	":normal vip<CR><PLUG>(DBUI_ExecuteQuery)",
	{ buffer = true, desc = "run query under cursor (mnemonic: Execute)" }
)
-- Query mappings (remapped to localleader)
vim.keymap.set(
	"n",
	"<localleader>w",
	"<Plug>(DBUI_SaveQuery)",
	{ buffer = true, desc = "Permanently save query for later use" }
)
