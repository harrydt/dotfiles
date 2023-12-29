local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "<localleader><localleader>", "<cmd>Telescope neorg find_norg_files<CR>", opts)
utils.map("n", "<localleader>/", '<cmd>Telescope live_grep search_dirs={"~/Dropbox/neorg"}<CR>', opts)
utils.map("n", "<localleader>i", "<cmd>Neorg index<CR>", opts)
utils.map("n", "<localleader>t", "<cmd>Neorg toc<CR>", opts)
utils.map("n", "<localleader>ff", "<cmd>Telescope neorg find_norg_files<CR>", opts)
utils.map("n", "<localleader>fl", "<cmd>Telescope neorg find_linkable<CR>", opts)
utils.map("n", "<localleader>fh", "<cmd>Telescope neorg search_headings<CR>", opts)
utils.map("n", "<localleader>ll", "<cmd>Telescope neorg insert_link<CR>", opts)
utils.map("n", "<localleader>lf", "<cmd>Telescope neorg insert_file_link<CR>", opts)
utils.map("n", "<localleader>j", "<cmd>Neorg journal<CR>", opts)
