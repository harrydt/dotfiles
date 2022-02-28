---- Packer Bootstrap ---------------------------
-------------------------------------------------
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)

    -----[[------------]]-----
	---     Essentials     ---
	-----]]------------[[-----
	-- Plugins manager
	use({
		'wbthomason/packer.nvim',
	})

    -- Common dependencies
    use({
        'nvim-lua/plenary.nvim',
        module = 'plenary',
    })

    -- Colorscheme
    use({
        'NTBBloodbath/doom-one.nvim',
        module = 'doom-one',
        setup = require('modules.config.color'),
    })

    -- Vimwiki/Org
    use({
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                {
                   path = '~/vimwiki',
                   syntax = 'markdown',
                   ext = '.md',
                }
            }
        end
    })


    -----[[------------]]-----
    ---     Essentials     ---
    -----]]------------[[-----
    -- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = require('modules.config.treesitter'),
	})

    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
		requires = "nvim-treesitter/nvim-treesitter",
    })
    -----[[------------]]-----
    ---     UI Related     ---
    -----]]------------[[-----
    -- Icons
    -- Development icons
	use({
		'kyazdani42/nvim-web-devicons',
		module = 'nvim-web-devicons',
	})

    -- File tree
	use({
		'kyazdani42/nvim-tree.lua',
		requires = 'nvim-web-devicons',
		config = require('modules.config.tree'),
		cmd = {
		    'NvimTreeOpen',
			'NvimTreeClipboard',
			'NvimTreeClose',
			'NvimTreeFindFile',
			'NvimTreeOpen',
			'NvimTreeRefresh',
			'NvimTreeToggle',
		},
	})

	-- Statusline
	-- can be disabled to use your own statusline
	use({
		'NTBBloodbath/galaxyline.nvim',
		config = require('modules.config.eviline'),
		event = 'BufWinEnter',
	})

    -- Tabline
	use({
		'akinsho/nvim-bufferline.lua',
		config = require('modules.config.bufferline'),
		event = 'BufWinEnter',
	})

    -- Better terminal
	use({
		'akinsho/nvim-toggleterm.lua',
		config = require('modules.config.toggleterm'),
		module = { 'toggleterm', 'toggleterm.terminal' },
		cmd = { 'ToggleTerm', 'TermExec' },
		keys = { 'n', '<F4>' },
	})

    -- Viewer & finder for LSP symbols and tags
    -- TODO This is so buggy. Need to find alternative
	--[[ use({
		'zeertzjq/symbols-outline.nvim',
        branch = 'patch-1',
		-- config = require('modules.config.symbols'),
		config = function()
            require"symbols-outline".setup {auto_preview = false}
		end,
		--[[ cmd = {
			'SymbolsOutline',
			'SymbolsOutlineOpen',
			'SymbolsOutlineClose',
		}, ]]
	-- }) ]]

	-- Minimap
	-- Depends on wfxr/code-minimap to work!
	use({
		'wfxr/minimap.vim',
		cmd = {
			'Minimap',
			'MinimapClose',
			'MinimapToggle',
			'MinimapRefresh',
			'MinimapUpdateHighlight',
		},
	})

	-- which-key
	-- Keybindings menu like Emacs's guide-key
	use({
		'folke/which-key.nvim',
		config = require('modules.config.whichkey'),
		event = 'BufWinEnter',
	})

    -----[[--------------]]-----
	---     Fuzzy Search     ---
	-----]]--------------[[-----
	use({
		'nvim-lua/popup.nvim',
		module = 'popup',
	})

    -- Telescope
    use({
		'nvim-telescope/telescope.nvim',
		-- cmd = 'Telescope',
		-- module = 'telescope',
		requires = {
			'popup.nvim',
			'plenary.nvim',
		},
		config = require('modules.config.telescope'),
	})

    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    })

    use({
        'ElPiloto/telescope-vimwiki.nvim'
    })

    -----[[-------------]]-----
	---     GIT RELATED     ---
	-----]]-------------[[-----
	-- Git gutter better alternative, written in Lua
	use({
		'lewis6991/gitsigns.nvim',
		config = require('modules.config.gitsigns'),
		requires = 'plenary.nvim',
		-- event = 'BufRead',
		event = { "CursorMoved", "CursorMovedI" },
	})

	-- Magit clone
	use({
        'TimUntersberger/neogit',
		requires = {
            {
	            "sindrets/diffview.nvim",
		        config = function()
		        	require("diffview").setup()
		        end
	        },
		    requires = 'plenary.nvim',
        },
        config = function()
	        require('neogit').setup({
                disable_hint = true,
                disable_insert_on_commit = false,
                signs = {
                    -- { CLOSED, OPENED }
                    section = { "", "" },
                    item = { "", "" },
                    hunk = { "", "" },
                },
                integrations = {
                    diffview = true,
                }
            })
	    end,
        cmd = 'Neogit',
	})

    -- Still neeed fugitive
    use({
        'tpope/vim-fugitive'
    })

    -- Github
    use({
        'tpope/vim-rhubarb'
    })


	-----[[------------]]-----
	---     Completion     ---
	-----]]------------[[-----
    -- Built-in LSP Config
	use({
		'neovim/nvim-lspconfig',
		opt = true,
		config = require('modules.config.lspconfig'),
		event = 'BufWinEnter',
	})

    -- Completion plugin
    use({
        "hrsh7th/nvim-cmp",
        wants = { "LuaSnip" },
        requires = {
            {
                "L3MON4D3/LuaSnip",
                event = "BufReadPre",
                wants = "friendly-snippets",
                config = require("modules.config.luasnip"),
                requires = { "rafamadriz/friendly-snippets" },
            },
            {
                "windwp/nvim-autopairs",
                config = require("modules.config.autopairs"),
                event = "BufReadPre",
            },
        },
        config = require("modules.config.cmp"),
        event = "InsertEnter",
    })
    use({
        "hrsh7th/cmp-nvim-lua",
        after = "nvim-cmp",
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-cmp",
    })
    use({
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
    })
    use({
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
    })
    use({
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
    })

    -- Snippets
	use({
		'L3MON4D3/LuaSnip',
		config = require('modules.config.luasnip'),
		requires = { 'rafamadriz/friendly-snippets' },
		event = 'BufWinEnter',
	})

    -- Show function signature when you type
    use({
        "ray-x/lsp_signature.nvim",
        config = require("modules.config.lsp-signature"),
        after = "nvim-lspconfig",
        event = "InsertEnter",
    })

	-- provides the missing `:LspInstall` for `nvim-lspconfig`.
    use({
        "williamboman/nvim-lsp-installer",
        config = require('modules.config.lsp-installer')
    })

	-- show diagnostic in list not inline
    use ({
        "folke/trouble.nvim",
        opt = true,
        after = 'nvim-lspconfig',
        config = function()
            require("trouble").setup {
            }
        end
    })

    -- LSP feature hook
    use ({
        "jose-elias-alvarez/null-ls.nvim",
        after = 'nvim-lspconfig',
        config = require('modules.config.null-ls')
    })

    -----[[--------------]]-----
	---     File Related     ---
	-----]]--------------[[-----

    -- Comments
	use({
		'b3nj5m1n/kommentary',
		event = 'BufEnter',
	})

    -- Indent Lines
	use({
		'lukas-reineke/indent-blankline.nvim',
		config = require('modules.config.blankline'),
		event = 'BufWinEnter',
	})

    -- Autopairs
	-- can be disabled to use your own autopairs
	use({
		'windwp/nvim-autopairs',
		config = require('modules.config.autopairs'),
		event = 'InsertEnter',
	})

	-- Write / Read files without permissions (e.vim.g. /etc files) without having
	-- to use `sudo nvim /path/to/file`
	use({
		'lambdalisue/suda.vim',
		cmd = { 'SudaRead', 'SudaWrite' },
	})

	-- File formatting
	-- can be disabled to use your own file formatter
	use({
		'lukas-reineke/format.nvim',
		config = require('modules.config.format'),
		event = 'BufWinEnter',
	})

    -- hightlights ranges you have entered in commandline.
	use({
		'winston0410/range-highlight.nvim',
		requires = {
			{ 'winston0410/cmd-parser.nvim', module = 'cmd-parser' },
		},
		config = function()
			require('range-highlight').setup()
		end,
		event = 'BufRead',
	})

    -- Smooth scrolling
    use({
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                hide_cursor = false,
            })
        end,
        event = "WinScrolled",
    })

    -- lua alternative for vim-surround
    -- TODO this repo is inactive. Find alternative
    use({
        "blackCauldron7/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end,
        event = 'BufRead',
    })

    -- Auto save
    use({"Pocco81/AutoSave.nvim"})

    -- better quickfix
    use({"kevinhwang91/nvim-bqf"})

    use({
        'phaazon/hop.nvim',
        -- branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    })

    -- Dev setup for init.lua and plugin development
    use({
        "folke/lua-dev.nvim",
        module = "lua-dev",
	})

    -- Automatically set up configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
