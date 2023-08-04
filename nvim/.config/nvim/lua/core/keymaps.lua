local opts = { silent = true }
local utils = require("core.utils")
local expr_opts = { silent = true, expr = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- stylua: ignore start
utils.map('n', '<ESC>', ':noh<CR>', opts)

-- Make Y behave
utils.map('n', 'Y', 'y$', opts)

-- Undo break points TODO what is this?
utils.map('i', ',', ',<C-G>u', opts)
utils.map('i', '.', '.<C-G>u', opts)
utils.map('i', '!', '!<C-G>u', opts)
utils.map('i', '?', '?<C-G>u', opts)

-- Map WhichKey popup menu
-- utils.map('n', '<Space>', ':WhichKey <leader><CR>', opts)

-- cycle buffers
utils.map('n', ']b', ':bnext<CR>', opts)
utils.map('n', '[b', ':bprevious<CR>', opts)

--- F<n> keybindings
utils.map('n', '<F2>', ':SymbolsOutline<CR>', opts)
utils.map('n', '<F3>', ':NeoTreeRevealToggle<CR>', opts)
utils.map('n', '<F5>', ':AerialToggle!<CR>', opts)

-- quickfix movements
utils.map('n', '[q', ':cprev<CR>', opts) -- Go to the previous item on the quickfix list
utils.map('n', ']q', ':cnext<CR>', opts) -- Go to the next item on the quickfix list

-- windows movement keys
utils.map('n', '<C-h>', '<C-w>h', opts)
utils.map('n', '<C-j>', '<C-w>j', opts)
utils.map('n', '<C-k>', '<C-w>k', opts)
utils.map('n', '<C-l>', '<C-w>l', opts)

-- get out of terminal insert mode into normal mode with Esc
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

-- resizing splits
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize +2<CR>
  nnoremap <silent> <C-Down>  :resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])

-- Disable ex mode
utils.map('n', 'Q', '<Nop>', opts)

-- Replicate vim-sneak in hop.nvim
utils.map('n', 's', ":HopChar2AC<CR>", opts)
utils.map('n', 'S', ":HopChar2BC<CR>", opts)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
utils.map('n', 'zR', '<cmd>lua require("ufo").openAllFolds()<CR>', opts)
utils.map('n', 'zM', '<cmd>lua require("ufo").closeAllFolds()<CR>', opts)

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

-- Plugins
utils.map('n', '<leader>ps', '<cmd>Lazy sync<CR>', opts)
utils.map('n', '<leader>pS', '<cmd>Lazy home<CR>', opts)
utils.map('n', '<leader>pr', '<cmd>Lazy restore<CR>', opts)
utils.map('n', '<leader>pc', '<cmd>Lazy clean<CR>', opts)


-- Find
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
utils.map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', opts)
utils.map('n', '<leader>ft', '<cmd>Telescope help_tags<CR>', opts)

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
utils.map('n', '<leader>gf', '<cmd>OpenInGHFile<CR>', opts)
utils.map('n', '<leader>gr', '<cmd>OpenInGHRepo<CR>', opts)

-- Organizing
utils.map('n', '<leader>ow', '<cmd>Neorg workspace main<CR>', opts)
utils.map('n', '<leader>oi', '<cmd>Neorg index<CR>', opts)
utils.map('n', '<leader>o/', '<cmd>Telescope live_grep search_dirs={"~/Dropbox/neorg"}<CR>', opts)
utils.map('n', '<leader>ot', '<cmd>Neorg toc<CR>', opts)
utils.map('n', '<leader>off', '<cmd>Telescope neorg find_norg_files<CR>', opts)
utils.map('n', '<leader>ofl', '<cmd>Telescope neorg find_linkable<CR>', opts)
utils.map('n', '<leader>ofh', '<cmd>Telescope neorg search_headings<CR>', opts)
utils.map('n', '<leader>oll', '<cmd>Telescope neorg insert_link<CR>', opts)
utils.map('n', '<leader>olf', '<cmd>Telescope neorg insert_file_link<CR>', opts)
utils.map('n', '<leader>oj', '<cmd>Neorg journal<CR>', opts)

-- Quit
utils.map('n', '<leader>qq', '<cmd>q<CR>', opts)
utils.map('n', '<leader>qa', '<cmd>qa<CR>', opts)
-- stylua: ignore end
