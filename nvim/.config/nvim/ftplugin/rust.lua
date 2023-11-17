local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "<localleader>r", "<cmd>RustRunnables<CR>", opts)
utils.map("n", "<localleader>p", "<cmd>RustParentModule<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>lua require'rust-tools'.ssr.ssr(query)<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>lua require'rust-tools'.ssr.ssr(query)<CR>", opts)
utils.map("n", "<localleader>e", "<cmd>lua require'rust-tools'.expand_macro.expand_macro()<CR>", opts)
