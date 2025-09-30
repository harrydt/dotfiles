local utils = require("core.utils")
local opts = { silent = true }

utils.map("n", "<localleader>r", "<cmd>RustLsp runnables<CR>", opts)
utils.map("n", "<localleader>p", "<cmd>RustLsp parentModule<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>RustLsp ssr<CR>", opts)
utils.map("n", "<localleader>s", "<cmd>lua require'rust-tools'.ssr.ssr(query)<CR>", opts)
utils.map("n", "<localleader>e", "<cmd>RustLsp expandMacro<CR>", opts)
