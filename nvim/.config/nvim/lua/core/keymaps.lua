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
utils.map('n', '<F2>', ':Neotree reveal toggle<CR>', opts)
utils.map('n', '<F3>', ':AerialToggle!<CR>', opts)

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

-- Common typos
-- :Q as :qa and :W as :wa
vim.api.nvim_create_user_command('Q', 'qa', {})
vim.api.nvim_create_user_command('W', 'wa', {})

-- oil.nvim
utils.map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		-- Helper for diagnostic navigation
		local function diagnostic_goto(next, severity)
			local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
			severity = severity and vim.diagnostic.severity[severity] or nil
			return function()
				go({ severity = severity })
			end
		end

		local keymap = vim.keymap.set
		local opts = { silent = true, buffer = bufnr }
		local function opt(desc, others)
			return vim.tbl_extend("force", opts, { desc = desc }, others or {})
		end

		-- Keymaps
		keymap("n", "<leader>cdl", vim.diagnostic.open_float, opt("Line Diagnostics"))
		keymap("n", "<leader>cli", "<cmd>LspInfo<cr>", opt("Lsp Info"))
		keymap("n", "gd", function()
			require("telescope.builtin").lsp_definitions({ reuse_win = true })
		end, opt("Goto Definition"))
		keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opt("References"))
		keymap("n", "gD", vim.lsp.buf.declaration, opt("Goto Declaration"))
		keymap("n", "gi", function()
			require("telescope.builtin").lsp_implementations({ reuse_win = true })
		end, opt("Goto Implementation"))
		keymap("n", "gy", function()
			require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
		end, opt("Goto T[y]pe Definition"))
		keymap("n", "K", function()
			return vim.lsp.buf.hover()
		end, opt("Hover"))
		keymap("n", "gK", vim.lsp.buf.signature_help, opt("Signature Help"))
		keymap("i", "<c-k>", vim.lsp.buf.signature_help, opt("Signature Help"))
		keymap("n", "]g", diagnostic_goto(true), opt("Next Diagnostic"))
		keymap("n", "[g", diagnostic_goto(false), opt("Prev Diagnostic"))
		keymap("n", "]e", diagnostic_goto(true, "ERROR"), opt("Next Error"))
		keymap("n", "[e", diagnostic_goto(false, "ERROR"), opt("Prev Error"))
		keymap("n", "]w", diagnostic_goto(true, "WARN"), opt("Next Warning"))
		keymap("n", "[w", diagnostic_goto(false, "WARN"), opt("Prev Warning"))
		keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opt("Code Action"))
		keymap("n", "<leader>cA", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source" },
					diagnostics = {},
				},
			})
		end, opt("Source Action"))

		-- Conditional rename keymap
		local has_inc_rename, inc_rename = pcall(require, "inc_rename")
		if has_inc_rename then
			keymap("n", "<leader>cr", function()
				return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
			end, vim.tbl_extend("force", opt("Rename"), { expr = true }))
		else
			keymap("n", "<leader>cr", vim.lsp.buf.rename, opt("Rename"))
		end
	end,
})


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
utils.map('n', '<leader>bd', '<cmd>enew<bar>bd #<CR>', opts)

utils.map(
  'n',
  '<leader>cdd',
  '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
  opts
)
utils.map(
  'n',
  '<leader>cdw',
  '<cmd>Trouble diagnostics toggle<CR>',
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
utils.map('n', '<leader>fs', '<cmd>Telescope persisted<CR>', opts)

-- search
utils.map(
  'n',
  '<leader>sb',
  '<cmd>lua require("telescope.builtin").live_grep({grep_open_files=true})<CR>',
  opts
)
utils.map('n', '<leader>sg', '<cmd>Telescope grep_string<CR>', opts) -- Searches for the string under your cursor in your current working directory
utils.map('n', '<leader>sh', '<cmd>Telescope command_history<CR>', opts)
utils.map('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>', opts)
utils.map('n', '<leader>sm', '<cmd>Telescope marks<CR>', opts)

-- test
utils.map('n', '<leader>tt', "<cmd>lua require('neotest').run.run()<CR>", opts)
utils.map('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
utils.map('n', '<leader>to', "<cmd>lua require('neotest').output.open({ enter = true })<CR>", opts)
utils.map('n', '<leader>tO', "<cmd>lua require('neotest').output_panel.toggle()<CR>", opts)
utils.map('n', '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<CR>", opts)

-- windows
utils.map('n', '<leader>ww', '<C-W>p', opts)
utils.map('n', '<leader>wd', '<C-W>c', opts)
utils.map('n', '<leader>ws', '<C-W>s', opts)
utils.map('n', '<leader>wv', '<C-W>v', opts)
utils.map('n', '<leader>wH', '<C-W>5<', opts)
utils.map('n', '<leader>wJ', '<cmd>resize +5<CR>', opts)
utils.map('n', '<leader>wL', '<C-W>5>', opts)
utils.map('n', '<leader>wK', '<cmd>resize -5<CR>', opts)
utils.map('n', '<leader>w=', '<C-W>=', opts)
utils.map('n', '<leader>wm', '<cmd>WinShift<CR>', opts)
utils.map('n', '<leader>wS', '<cmd>WinShift swap<CR>', opts)
utils.map('n', '<leader>wc', '<cmd>NoNeckPain<CR>', opts)

-- git
utils.map('n', '<leader>go', '<cmd>Neogit<CR>', opts)
-- DiffviewToggle when?
utils.map('n', '<leader>gdo', '<cmd>DiffviewOpen<CR>', opts)
utils.map('n', '<leader>gdc', '<cmd>DiffviewClose<CR>', opts)
utils.map('n', '<leader>gdf', '<cmd>DiffviewFileHistory<CR>', opts)
-- utils.map uses nvim.set_keymap which doesn't support lua functions directly
vim.keymap.set('n', '<leader>gdm', function() vim.cmd('DiffviewOpen ' .. utils.get_default_branch_name()) end, opts)
vim.keymap.set('n', '<leader>gdM', function()  vim.cmd('DiffviewOpen HEAD..origin/' .. utils.get_default_branch_name())end, opts)
utils.map('n', '<leader>gdf', '<cmd>DiffviewFileHistory<CR>', opts)
utils.map('n', '<leader>gp', '<cmd>G pull<CR>', opts)
utils.map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', opts)
utils.map('n', '<leader>gb', '<cmd>Git blame<CR>', opts)
utils.map('n', '<leader>gB', '<cmd>Telescope git_branches<CR>', opts)
utils.map('n', '<leader>gl', '<cmd>Telescope git_commits<CR>', opts)  -- list git commits/git log
utils.map('n', '<leader>gc', '<cmd>Telescope git_bcommits<CR>', opts) -- list buffer's git commits
utils.map('n', '<leader>gr', '<cmd>.GBrowse<CR>', opts)
utils.map('n', '<leader>gR', '<cmd>GBrowse<CR>', opts)
utils.map('n', '<leader>ga', '<cmd>AdvancedGitSearch<CR>', opts)

-- Organizing
utils.map('n', '<leader>ow', '<cmd>Neorg workspace main<CR>', opts)
utils.map('n', '<leader>or', '<cmd>Neorg return<CR>', opts)

-- Quit
utils.map('n', '<leader>qq', '<cmd>q<CR>', opts)
utils.map('n', '<leader>qa', '<cmd>qa<CR>', opts)
-- stylua: ignore end

-- Check if diff mode is enabled
if vim.opt.diff:get() then
	-- Define key mappings for diff mode
	vim.api.nvim_set_keymap("n", "<localleader>1", ":diffget LOCAL<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<localleader>2", ":diffget BASE<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<localleader>3", ":diffget REMOTE<CR>", { noremap = true, silent = true })
end

-- llm
utils.map("n", "<leader>la", "<cmd>CodeCompanionActions<CR>", opts)
utils.map("v", "<leader>la", "<cmd>CodeCompanionActions<CR>", opts)
utils.map("n", "<leader>lt", "<cmd>CodeCompanionChat Toggle<CR>", opts)
utils.map("n", "<leader>li", ":CodeCompanion<CR>", opts)
utils.map("v", "<leader>lA", "<cmd>CodeCompanionAdd<CR>", opts)
