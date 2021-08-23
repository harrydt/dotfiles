local utils = require('core.utils')
-- Additional options for mappings
local opts = { silent = true }

-- Make Y behave
utils.map('n', 'Y', 'y$', opts)

-- Undo break points
utils.map('i', ',', ',<C-G>u', opts)
utils.map('i', '.', '.<C-G>u', opts)
utils.map('i', '!', '!<C-G>u', opts)
utils.map('i', '?', '?<C-G>u', opts)

-- Map WhichKey popup menu
utils.map('n', '<Space>', ':WhichKey <leader><CR>', opts)

-- TAB to cycle buffers too, why not?
utils.map('n', '<Tab>', ':bnext<CR>', opts)
utils.map('n', '<S-Tab>', ':bprevious<CR>', opts)

-- ESC to turn off search highlighting
utils.map('n', '<esc>', ':noh<CR>', opts)

-- ESC in INSERT mode to save current buffer
utils.map('i', '<esc>', '<esc>:update<CR>')

--- F<n> keybindings
utils.map('n', '<F2>', ':SymbolsOutline<CR>', opts)
utils.map('n', '<F3>', ':NvimTreeToggle<CR>', opts)
utils.map('n', '<F5>', ':MinimapToggle<CR>', opts)
-- utils.map('n', '<F6>', ':TZAtaraxis<CR>', opts)
-- utils.map('n', '<F7>', ':<Plug>RestNvim<CR>', opts)

---[[------------------------------]]---
--     Window Movements keys          --
---]]------------------------------]]---
utils.map('n', '<C-h>', '<C-w>h', opts)
utils.map('n', '<C-j>', '<C-w>j', opts)
utils.map('n', '<C-k>', '<C-w>k', opts)
utils.map('n', '<C-l>', '<C-w>l', opts)

---[[-----------------]]---
--    Select Movement    --
---]]-----------------[[---
-- get out of terminal insert mode into normal mode with Esc
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

---[[-----------------]]---
--    Resizing Splits    --
---]]-----------------[[---
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize +2<CR>
  nnoremap <silent> <C-Down>  :resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])

---[[-----------------]]---
--     Disable keys      --
---]]-----------------[[---
-- Disable accidentally pressing ctrl-z and suspending
utils.map('n', '<c-z>', '<Nop>', opts)

-- Disable ex mode
utils.map('n', 'Q', '<Nop>', opts)

---[[-----------------]]---
--    LSP Keybindings    --
---]]-----------------[[---
local lsp_opts = vim.tbl_extend('force', opts, { expr = true })
-- https://github.com/hrsh7th/nvim-compe#mappings
utils.map('i', '<C-Space>', 'compe#complete()', lsp_opts)
utils.map('i', '<CR>', 'compe#confirm("<CR>")', lsp_opts)
utils.map('i', '<C-e>', 'compe#close("<C-e>")', lsp_opts)
utils.map('i', '<C-f>', 'compe#scroll({ "delta": +4 })', lsp_opts)
utils.map('i', '<C-d>', 'compe#scroll({ "delta": -4 })', lsp_opts)
utils.map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
utils.map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts) -- gd: jump to definition
utils.map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts) -- gr: go to reference
utils.map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts) -- gi: buf implementation
utils.map('n', 'ca', ':Lspsaga code_action<CR>', opts) -- ca: code actions
utils.map('n', 'K', ':Lspsaga hover_doc<CR>', opts) -- K: hover doc
utils.map('n', '[g', ':Lspsaga diagnostic_jump_prev<CR>', opts) -- Jump to previous diagnostic
utils.map('n', ']g', ':Lspsaga diagnostic_jump_next<CR>', opts) -- Jump to next diagnostic
utils.map(
	'n',
	'<C-f>',
	':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',
	opts
) -- Control+f: Scroll down documents
utils.map(
	'n',
	'<C-b>',
	":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
	opts
) -- Control+b: Scroll up documents
vim.cmd(
	'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()'
)
-- LuaSnip mappings
utils.map(
	'n',
	'<Tab>',
	'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
	lsp_opts
)
utils.map('i', '<S-Tab>', '<cmd>lua require("luasnip").jump(-1)<CR>', opts)

utils.map('s', '<Tab>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
utils.map('s', '<S-Tab>', '<cmd>lua require("luasnip").jump(-1)<CR>', opts)

utils.map(
	'i',
	'<C-E>',
	'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
	lsp_opts
)
utils.map(
	's',
	'<C-E>',
	'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
	lsp_opts
)

-- code
-- utils.map('n', '<leader>ch', '<Plug>RestNvim<CR>', opts)
--[[ utils.map(
	'n',
	'<leader>ci',
	'<cmd>lua require("doom.modules.built-in.runner").start_repl()<CR>',
	opts
)
utils.map(
	'n',
	'<leader>cr',
	'<cmd>lua require("doom.modules.built-in.runner").run_code()<CR>',
	opts
)
utils.map(
	'n',
	'<leader>cb',
	'<cmd>lua require("doom.modules.built-in.compiler").compile()<cr>',
	opts
)
utils.map(
	'n',
	'<leader>cc',
	'<cmd>lua require("doom.modules.built-in.compiler").compile_and_run()<cr>',
	opts
) ]]
utils.map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
-- code/diagnostic
utils.map(
	'n',
	'<leader>cdl',
	'<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>',
	opts
)
utils.map(
	'n',
	'<leader>cdd',
	'<cmd>TroubleToggle lsp_document_diagnostics<CR>',
	opts
)
utils.map(
	'n',
	'<leader>cdw',
	'<cmd>TroubleToggle lsp_workspace_diagnostics<CR>',
	opts
)
utils.map('n', '<leader>cr', ':Lspsaga rename<CR>', opts)
-- code/lsp
utils.map('n', '<leader>cli', '<cmd>LspInfo<CR>', opts)
-- utils.map('n', '<leader>cla', '<cmd>Lspsaga code_action<CR>', opts)
utils.map(
	'n',
	'<leader>cld',
	'<cmd>lua vim.lsp.buf.type_definition()<CR>',
	opts
)
utils.map('n', '<leader>cp', '<cmd>Lspsaga preview_definition<CR>', opts)
--[[ utils.map(
	'n',
	'<leader>clL',
	'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
	opts
) ]]


---[[-----------------]]---
--    WhichKey binds     --
---]]-----------------[[---

-- Misc
utils.map('n', '<leader>`', '<cmd>e #<CR>', opts)
utils.map('n', '<leader><space>', '<cmd>Telescope find_files<CR>', opts)
utils.map('n', '<leader>.', '<cmd>Telescope file_browser<CR>', opts)
utils.map(
	'n',
	'<leader>,',
	'<cmd>Telescope buffers show_all_buffers=true<CR>',
	opts
)
utils.map('n', '<leader>/', '<cmd>Telescope live_grep<CR>', opts)
utils.map('n', '<leader>:', '<cmd>Telescope command_history<CR>', opts)

-- Buffers
utils.map(
	'n',
	'<leader>bc',
	'<cmd>lua require("bufferline").handle_close_buffer(vim.fn.bufnr("%"))<CR>',
	opts
)
utils.map('n', '<leader>bb', '<cmd>e #<CR>', opts)
utils.map(
	'n',
	'<leader>b]',
	'<cmd>lua require("bufferline").cycle(1)<CR>',
	opts
)
utils.map(
	'n',
	'<leader>bn',
	'<cmd>lua require("bufferline").cycle(1)<CR>',
	opts
)
utils.map(
	'n',
	'<leader>bg',
	'<cmd>lua require("bufferline").pick_buffer()<CR>',
	opts
)
utils.map(
	'n',
	'<leader>b[',
	'<cmd>lua require("bufferline").cycle(-1)<CR>',
	opts
)
utils.map(
	'n',
	'<leader>bp',
	'<cmd>lua require("bufferline").cycle(-1)<CR>',
	opts
)
utils.map('n', '<leader>bf', '<cmd>FormatWrite<CR>', opts)

-- Plugins
utils.map('n', '<leader>ps', '<cmd>PackerSync<CR>', opts)
utils.map('n', '<leader>pi', '<cmd>PackerInstall<CR>', opts)
utils.map('n', '<leader>pc', '<cmd>PackerClean<CR>', opts)
utils.map('n', '<leader>pC', '<cmd>PackerCompile<CR>', opts)
utils.map('n', '<leader>pS', '<cmd>PackerStatus<CR>', opts)
utils.map('n', '<leader>pp', '<cmd>PackerProfile<CR>', opts)

-- Org
utils.map('n', '<leader>oi', '<cmd>VimwikiIndex<CR>', opts)
utils.map('n', '<leader>odn', '<cmd>VimwikiMakeDiaryNote<CR>', opts)
utils.map('n', '<leader>odi', '<cmd>VimwikiDiaryIndex<CR>', opts)
utils.map('n', '<leader>odg', '<cmd>VimwikiDiaryGenerateLinks<CR>', opts)

-- files
utils.map('n', '<leader>fc', '<cmd>e $MYVIMRC<CR>', opts)
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)

utils.map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', opts)
utils.map('n', '<leader>ft', '<cmd>Telescope help_tags<CR>', opts)
utils.map('n', '<leader>fR', '<cmd>SudaRead<CR>', opts)
utils.map('n', '<leader>fw', '<cmd>SudaWrite<CR>', opts)

-- search
utils.map('n', '<leader>sg', '<cmd>Telescope live_grep<CR>', opts)
utils.map(
	'n',
	'<leader>sb',
	'<cmd>Telescope current_buffer_fuzzy_find<CR>',
	opts
)
utils.map('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>', opts)
utils.map('n', '<leader>sh', '<cmd>Telescope command_history<CR>', opts)
utils.map('n', '<leader>sm', '<cmd>Telescope marks<CR>', opts)
utils.map('n', '<leader>sr', '<cmd>Rg<CR>', opts)

-- windows
utils.map('n', '<leader>ww', '<C-W>p', opts)
utils.map('n', '<leader>wd', '<C-W>c', opts)
utils.map('n', '<leader>w-', '<C-W>s', opts)
utils.map('n', '<leader>w|', '<C-W>v', opts)
utils.map('n', '<leader>w2', '<C-W>v', opts)
utils.map('n', '<leader>wh', '<C-W>h', opts)
utils.map('n', '<leader>wj', '<C-W>j', opts)
utils.map('n', '<leader>wl', '<C-W>l', opts)
utils.map('n', '<leader>wk', '<C-W>k', opts)
utils.map('n', '<leader>wH', '<C-W>5<', opts)
utils.map('n', '<leader>wJ', '<cmd>resize +5<CR>', opts)
utils.map('n', '<leader>wL', '<C-W>5>', opts)
utils.map('n', '<leader>wK', '<cmd>resize -5<CR>', opts)
utils.map('n', '<leader>w=', '<C-W>=', opts)
utils.map('n', '<leader>ws', '<C-W>s', opts)
utils.map('n', '<leader>wv', '<C-W>v', opts)

-- git
utils.map('n', '<leader>go', '<cmd>Neogit<CR>', opts)
utils.map('n', '<leader>gl', '<cmd>TermExec cmd="git pull"<CR>', opts)
utils.map('n', '<leader>gp', '<cmd>TermExec cmd="git push"<CR>', opts)
utils.map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', opts)
utils.map('n', '<leader>gb', '<cmd>Git blame<CR>', opts)
utils.map('n', '<leader>gB', '<cmd>Telescope git_branches<CR>', opts)
utils.map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', opts)

