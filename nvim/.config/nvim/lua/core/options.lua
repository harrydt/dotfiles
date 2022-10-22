local o = vim.opt

-- Global options
o.hidden = true
o.updatetime = 200
o.timeoutlen = 500
o.completeopt = {
    'menu',
    'menuone',
    'preview',
    'noinsert',
    'noselect',
}
o.shortmess:append('atsc')
o.inccommand = 'split'
o.path = '**'
o.signcolumn = 'yes'
o.foldenable = true

-- case insensitive search
o.ignorecase = true

-- Buffer options
o.smartindent = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Windows split
o.splitright = true
o.splitbelow = true

-- Scroll off
-- o.scrolloff = true

-- no show mode
o.showmode = false

-- Enable mouse
o.mouse = 'a'

-- Enable wrapping
o.wrap = true

-- no swap file
o.swapfile = false

-- show number
o.number = true

-- use undofile
o.undofile = true
local undodir = vim.fn.stdpath('config') .. '/undodir'
-- if vim.fn.empty(undo_dir) > 0 then
--     vim.api.nvim_command('!mkdir ' .. undo_dir .. ' -p')
-- end

-- convert tabs to spaces
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- UI
o.cursorline = true
o.termguicolors = true

-- global statusline
o.laststatus = 3

o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}%=%m %f"
