vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

opt.cursorline = true -- Enable highlighting of the current line
opt.number = true -- Print line number
opt.scrolloff = 4 -- Lines of context
opt.smartcase = true -- Don't ignore case with capitals
opt.clipboard = "unnamedplus" -- Sync with system clipboard
