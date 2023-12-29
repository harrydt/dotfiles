local utils = require("core.utils")
local opts = { silent = true }

-- test
utils.map("n", "<localleader>tf", "<cmd>GoTestFunc<CR>", opts)
utils.map("n", "<localleader>ts", "<cmd>GoTestFunc -s<CR>", opts)
utils.map("n", "<localleader>tF", "<cmd>GoTestFile<CR>", opts)
utils.map("n", "<localleader>tp", "<cmd>GoTestPkg<CR>", opts)
utils.map("n", "<localleader>taf", "<cmd>GoAddTest [-parallel]<CR>", opts)
utils.map("n", "<localleader>tae", "<cmd>GoAddExpTest [-parallel]<CR>", opts)
utils.map("n", "<localleader>taa", "<cmd>GoAddAllTest [-parallel]<CR>", opts)

-- tags
utils.map("n", "<localleader>Ta", "<cmd>GoAddTag<CR>", opts)
utils.map("n", "<localleader>Tr", "<cmd>GoRemoveTag<CR>", opts)

-- binaries
utils.map("n", "<localleader>bi", "<cmd>GoInstallBinaries<CR>", opts)
utils.map("n", "<localleader>bu", "<cmd>GoUpdateBinaries<CR>", opts)
