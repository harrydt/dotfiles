vim.keymap.set(
	"n",
	"<localleader>e",
	":normal vip<CR><PLUG>(DBUI_ExecuteQuery)",
	{ buffer = true, desc = "run query under cursor (mnemonic: Execute)" }
)
