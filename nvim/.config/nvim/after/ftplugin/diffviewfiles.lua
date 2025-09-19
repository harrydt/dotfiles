local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "q", "<cmd>DiffviewClose<CR>", opts)
