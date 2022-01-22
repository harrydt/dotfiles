return function()
	local fn = vim.fn
	local lsp = vim.lsp

	-- Lsp Symbols
	local signs, hl
	signs = {
		Error = '',
		Warn = '',
		Info = '',
		Hint = '',
	}
	hl = "DiagnosticSign"

	for severity, icon in pairs(signs) do
		local highlight = hl .. severity

		fn.sign_define(highlight, {
			text = icon,
			texthl = highlight,
			numhl = highlight,
		})
	end


	lsp.handlers["textDocument/publishDiagnostics"] =
		lsp.with(lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false
		})

	-- Border for lsp_popups
	lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})
	lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "single",
	})
	-- symbols for autocomplete
	lsp.protocol.CompletionItemKind = {
		" 	(Text) ",
		" 	(Method)",
		" 	(Function)",
		" 	(Constructor)",
		" ﴲ	(Field)",
		" 	(Variable)",
		" 	(Class)",
		" ﰮ	(Interface)",
		" 	(Module)",
		" ﰠ	(Property)",
		" 	(Unit)",
		" 	(Value)",
		" 練 (Enum)",
		" 	(Keyword)",
		" 	(Snippet)",
		" 	(Color)",
		" 	(File)",
		" 	(Reference)",
		" 	(Folder)",
		" 	(EnumMember)",
		" ﲀ	(Constant)",
		" ﳤ	(Struct)",
		" 	(Event)",
		" 	(Operator)",
		" 	(TypeParameter)",
	}

	-- suppress error messages from lang servers
	vim.notify = function(msg, log_level, _opts)
		if msg:match("exit code") then
			return
		end
		if log_level == vim.log.levels.ERROR then
			vim.api.nvim_err_writeln(msg)
		else
			vim.api.nvim_echo({ { msg } }, true, {})
		end
	end
end
