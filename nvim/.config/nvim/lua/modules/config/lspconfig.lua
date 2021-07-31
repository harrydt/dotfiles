return function()
	-- Snippets support
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- Lsp Symbols
	vim.fn.sign_define('LspDiagnosticsSignError', {
		texthl = 'LspDiagnosticsSignError',
		text = '',
		numhl = 'LspDiagnosticsSignError',
	})
	vim.fn.sign_define('LspDiagnosticsSignWarning', {
		texthl = 'LspDiagnosticsSignWarning',
		text = '',
		numhl = 'LspDiagnosticsSignWarning',
	})
	vim.fn.sign_define('LspDiagnosticsSignHint', {
		texthl = 'LspDiagnosticsSignHint',
		text = '',
		numhl = 'LspDiagnosticsSignHint',
	})
	vim.fn.sign_define('LspDiagnosticsSignInformation', {
		texthl = 'LspDiagnosticsSignInformation',
		text = '',
		numhl = 'LspDiagnosticsSignInformation',
	})

	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			--[[ virtual_text = {
				prefix = ' ', -- diagnostic icon
			}, ]]
			virtual_text = false
		}
	)
	-- symbols for autocomplete
	vim.lsp.protocol.CompletionItemKind = {
		'   (Text) ',
		'   (Method)',
		'   (Function)',
		'   (Constructor)',
		' ﴲ  (Field)',
		'[] (Variable)',
		'   (Class)',
		' ﰮ  (Interface)',
		'   (Module)',
		' 襁 (Property)',
		'   (Unit)',
		'   (Value)',
		' 練 (Enum)',
		'   (Keyword)',
		'   (Snippet)',
		'   (Color)',
		'   (File)',
		'   (Reference)',
		'   (Folder)',
		'   (EnumMember)',
		' ﲀ  (Constant)',
		' ﳤ  (Struct)',
		'   (Event)',
		'   (Operator)',
		'   (TypeParameter)',
	}
end

