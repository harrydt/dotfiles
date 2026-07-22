local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "<localleader>r", "<cmd>HttpieRun<CR>", opts)
utils.map("n", "<localleader>n", "<cmd>HttpieNew<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>HttpieSave<CR>", opts)
utils.map("v", "<localleader>i", ":HttpieImport<CR>", opts)
utils.map("n", "<localleader>e", "<cmd>HttpieExport<CR>", opts)
