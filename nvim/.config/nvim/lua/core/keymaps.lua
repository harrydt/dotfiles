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
-- <Tab> not working in kitty?
--[[ utils.map('n', '<Tab>', ':bnext<CR>', opts)
utils.map('n', '<S-Tab>', ':bprevious<CR>', opts) ]]
utils.map('n', ']b', ':bnext<CR>', opts)
utils.map('n', '[b', ':bprevious<CR>', opts)

-- ESC to turn off search highlighting
-- utils.map('n', '<C-_>', ':noh<CR>', opts) -- TODO this is not working in kitty
utils.map('n', '<C-s>', ':noh<CR>', opts) -- TODO this is not working in kitty

-- ESC in INSERT mode to save current buffer
utils.map('i', '<esc>', '<esc>:update<CR>')

--- F<n> keybindings
utils.map('n', '<F2>', ':SymbolsOutline<CR>', opts)
utils.map('n', '<F3>', ':NeoTreeRevealToggle<CR>', opts)
utils.map('n', '<F5>', ':Telescope file_browser<CR>', opts)

-- quickfix movements
utils.map('n', '[q', ':cprev<CR>', opts) -- Go to the previous item on the quickfix list
utils.map('n', ']q', ':cnext<CR>', opts) -- Go to the next item on the quickfix list


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

-- Replicate vim-sneak in hop.nvim
utils.map('n', 's', ":HopChar2AC<CR>", opts)
utils.map('n', 'S', ":HopChar2BC<CR>", opts)


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
utils.map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
utils.map('n', 'gd', ':Telescope lsp_definitions<CR>', opts) -- Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
utils.map('n', 'gr', ':Telescope lsp_references<CR>', opts) -- Lists LSP references for word under the cursor
utils.map('n', 'gi', ':Telescope lsp_implementations<CR>', opts) -- Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
utils.map('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>', opts) -- Lists any LSP actions for the word under the cursor, that can be triggered with <cr>

utils.map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
utils.map('n', '[g', ':lua vim.diagnostic.goto_prev()<CR>', opts) -- Jump to previous diagnostic
utils.map('n', ']g', ':lua vim.diagnostic.goto_next()<CR>', opts) -- Jump to next diagnostic
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

utils.map(
    'n',
    '<leader>cdl',
    -- '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    '<cmd>lua vim.diagnostic.open_float()<CR>',
    opts
)
utils.map(
    'n',
    '<leader>cdd',
    '<cmd>TroubleToggle document_diagnostics<CR>',
    opts
)
utils.map(
    'n',
    '<leader>cdw',
    '<cmd>TroubleToggle workspace_diagnostics<CR>',
    opts
)
utils.map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
utils.map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
utils.map(
    'n',
    '<leader>cld',
    '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    opts
)
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
    '<cmd>bufdo bwipeout<CR>',
    opts
)
utils.map('n', '<leader>bb', '<cmd>e #<CR>', opts)
utils.map('n', '<leader>bd', ':lua MiniBufremove.delete()<CR>', opts)
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
utils.map('n', '<leader>pu', '<cmd>PackerUpdate<CR>', opts)

-- Org/Vimwiki
--[[ utils.map('n', '<leader>oi', '<cmd>VimwikiIndex<CR>', opts)
utils.map('n', '<leader>os', '<cmd>Telescope vw live_grep<CR>', opts)
utils.map('n', '<leader>odn', '<cmd>VimwikiMakeDiaryNote<CR>', opts)
utils.map('n', '<leader>odi', '<cmd>VimwikiDiaryIndex<CR>', opts)
utils.map('n', '<leader>odg', '<cmd>VimwikiDiaryGenerateLinks<CR>', opts) ]]

-- files
utils.map('n', '<leader>fc', '<cmd>e $MYVIMRC<CR>', opts)
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)

utils.map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', opts)
utils.map('n', '<leader>ft', '<cmd>Telescope help_tags<CR>', opts)
utils.map('n', '<leader>fR', '<cmd>SudaRead<CR>', opts)
utils.map('n', '<leader>fw', '<cmd>SudaWrite<CR>', opts)

-- search
utils.map(
    'n',
    '<leader>sb',
    '<cmd>Telescope current_buffer_fuzzy_find<CR>',
    opts
)
utils.map('n', '<leader>sg', '<cmd>Telescope grep_string<CR>', opts) -- Searches for the string under your cursor in your current working directory
utils.map('n', '<leader>sh', '<cmd>Telescope command_history<CR>', opts)
utils.map('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>', opts)
utils.map('n', '<leader>sm', '<cmd>Telescope marks<CR>', opts)

-- windows
utils.map('n', '<leader>ww', '<C-W>p', opts)
utils.map('n', '<leader>wd', '<C-W>c', opts)
utils.map('n', '<leader>ws', '<C-W>s', opts)
utils.map('n', '<leader>wv', '<C-W>v', opts)
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

-- git
utils.map('n', '<leader>go', '<cmd>Neogit<CR>', opts)
utils.map('n', '<leader>gp', '<cmd>TermExec cmd="git pull"<CR>', opts)
utils.map('n', '<leader>gP', '<cmd>TermExec cmd="git push"<CR>', opts)
utils.map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', opts)
utils.map('n', '<leader>gb', '<cmd>Git blame<CR>', opts)
utils.map('n', '<leader>gB', '<cmd>Telescope git_branches<CR>', opts)
utils.map('n', '<leader>gl', '<cmd>Telescope git_commits<CR>', opts) -- list git commits/git log
utils.map('n', '<leader>gc', '<cmd>Telescope git_bcommits<CR>', opts) -- list buffer's git commits

-- neorg
utils.map('n', '<leader>os', '<cmd>NeorgStart silent=true<CR>', opts)
utils.map('n', '<leader>oj', '<cmd>Neorg journal<CR>', opts)
utils.map('n', '<leader>ogv', '<cmd>Neorg gtd views<CR>', opts)

-- Quit
utils.map('n', '<leader>qq', '<cmd>q<CR>', opts)
utils.map('n', '<leader>qa', '<cmd>qa<CR>', opts)
