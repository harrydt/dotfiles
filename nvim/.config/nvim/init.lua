-- .
-- ├── init.lua
-- ├── ...
-- └── lua
--     ├── plugins
--     │   ├── init.lua
--     │   └── telescope.lua
--     └── core
--         ├── init.lua
--         ├── lazy_bootstrap.lua
--         ├── maps.lua
--         └── options.lua


-- Bootstrap Lazy
require("core/lazy_bootstrap") -- bootstraps folke/lazy

-- Load core settings
require("core")         -- loads lua/user/init.lua
require("core/options") -- loads lua/user/options.lua
require("core/keymaps") -- etc.

-- Load plugins
require("lazy").setup("plugins") -- loads each lua/plugins/*
