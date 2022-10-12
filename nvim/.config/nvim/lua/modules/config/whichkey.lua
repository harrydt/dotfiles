return function()
    local wk = require('which-key')
    local presets = require('which-key.plugins.presets')

    -- Disable presets that doom nvim doesn't use
    presets.operators['gc'] = nil

    wk.setup({
        plugins = {
            marks = false,
            registers = false,
            presets = {
                operators = false,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        operators = {
            d = 'Delete',
            c = 'Change',
            y = 'Yank (copy)',
            ['g~'] = 'Toggle case',
            ['gu'] = 'Lowercase',
            ['gU'] = 'Uppercase',
            ['>'] = 'Indent right',
            ['<lt>'] = 'Indent left',
            ['zf'] = 'Create fold',
            ['!'] = 'Filter though external program',
        },
        icons = {
            breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
            separator = '➜', -- symbol used between a key and it's label
            group = '+', -- symbol prepended to a group
        },
        key_labels = {
            ['<space>'] = 'SPC',
            ['<cr>'] = 'RET',
            ['<tab>'] = 'TAB',
        },
        window = {
            padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = { min = 1, max = 10 }, -- min and max height of the columns
            spacing = 3,
            align = 'left',
        },
        ignore_missing = true,
        hidden = {
            '<silent>',
            '<Cmd>',
            '<cmd>',
            '<Plug>',
            'call',
            'lua',
            '^:',
            '^ ',
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = 'auto', -- automatically setup triggers
    })

    ----- Whichkey binds ------------------------
    ---------------------------------------------
    local mappings = {
        ['`'] = { 'Switch buffer' },
        [' '] = { 'Find file' },
        ['.'] = { 'Browse files' },
        [','] = { 'Switch buffer' },
        ['/'] = { 'Search a word' },
        [':'] = { 'Command history' },
        ['b'] = {
            name = '+buffers',
            ['c'] = { 'Clear all buffers' },
            ['f'] = { 'Format buffer' },
            ['b'] = { 'Switch to other buffer' },
            ['d'] = { 'Delete buffer' },
            [']'] = { 'Next buffer' },
            ['n'] = { 'Next buffer' },
            ['g'] = { 'Goto buffer' },
            ['['] = { 'Previous buffer' },
            ['p'] = { 'Previous buffer' },
        },
        ['c'] = {
            name = '+code',
            a = { 'Actions' },
            d = {
                name = '+diagnostic',
                ['l'] = { 'Show line diagnostics' },
                ['d'] = { 'Show document diagnostics' },
                ['w'] = { 'Show workspace diagnostics' },
            },
            r = { 'Rename' },
            --[[ i = { 'Start a REPL' },
			b = { 'Compile project' },
			c = { 'Compile and run project' }, ]]
            --[[ ['h'] = {
				'Run restclient on the line that the cursor is currently on',
			}, ]]

            ['l'] = {
                name = '+lsp',
                ['i'] = { 'Lsp info' },
                ['d'] = { 'Show type definition' },
                -- ['l'] = { 'Show line diagnostics' },
                -- ['L'] = { 'Diagnostics into location list' },
            },
        },
        -- change this to debug later maybe?
        --[[ ['d'] = {
			name = '+doom',
			['c'] = { 'Edit your Doom Nvim configuration' },
			['d'] = { 'Open Doom Nvim documentation' },
			['u'] = { 'Update Doom Nvim' },
			['r'] = { 'Rollback Doom Nvim version' },
			['R'] = { 'Create crash report' },
			['s'] = { 'Change colorscheme' },
		}, ]]
        ['f'] = {
            name = '+file',
            ['c'] = { 'Edit Neovim configuration' },
            ['n'] = { 'Create a new unnamed buffer' },
            ['f'] = { 'Find files' },
            ['t'] = { 'Help tags' },
            ['r'] = { 'Recently opened files' },
            ['w'] = { 'Write file with sudo permissions' },
            ['R'] = { 'Re-open file with sudo permissions' },
        },
        ['g'] = {
            name = '+git',
            ['o'] = { 'Open Neogit' },
            ['p'] = { 'Pull' },
            ['P'] = { 'Push' },
            ['s'] = { 'Status' },
            ['b'] = { 'Blame line' },
            ['B'] = { 'Branches' },
            ['l'] = { 'Log' },
            ['c'] = { 'Commits of buffer' },
            ['f'] = { 'Open file in Github' },
            ['r'] = { 'Open repo in Github' },
        },
        ['p'] = {
            name = '+plugins',
            ['c'] = { 'Clean disabled or unused plugins' },
            ['C'] = { 'Compile your plugins changes' },
            ['i'] = { 'Install missing plugins' },
            ['p'] = { 'Profile the time taken loading your plugins' },
            ['s'] = { 'Sync your plugins' },
            ['S'] = { 'Plugins status' },
            ['u'] = { 'Update plugins' },
        },
        ['q'] = {
            name = '+quit/sessions',
            ['q'] = { 'Quit window' },
            ['a'] = { 'Quit all' },
        },
        ['s'] = {
            name = '+search',
            ['g'] = { 'Grep' },
            ['b'] = { 'Buffer' },
            ['s'] = { 'Goto symbol' },
            ['h'] = { 'Command history' },
            ['m'] = { 'Jump to mark' },
        },
        ['w'] = {
            name = '+windows',
            ['w'] = { 'Other window' },
            ['d'] = { 'Delete window' },
            ['s'] = { 'Split window below' },
            ['v'] = { 'Split window right' },
            ['2'] = { 'Layout double columns' },
            ['h'] = { 'Window left' },
            ['j'] = { 'Window below' },
            ['l'] = { 'Window right' },
            ['k'] = { 'Window up' },
            ['H'] = { 'Expand window left' },
            ['J'] = { 'Expand window below' },
            ['L'] = { 'Expand window right' },
            ['K'] = { 'Expand window up' },
            ['='] = { 'Balance window' },
        },
        --[[ ['o'] = {
			name = '+open',
			['d'] = { 'Start screen' },
			['e'] = { 'Tree Explorer' },
			['m'] = { 'Minimap' },
			['s'] = { 'Symbols' },
			['t'] = { 'Terminal' },
		}, ]]
        -- o will be "org" instead of "open"
        -- will be vimwiki until neorg is ready
        ['o'] = {
            name = '+org',
            ['s'] = { 'Start Neorg' },
            ['j'] = { 'Journal' },
            ['g'] = {
                name = '+gtd',
                ['v'] = 'Views',
                ['t'] = {
                    name = '+Task',
                    ['v'] = { 'Views' },
                    ['c'] = { 'Capture' },
                    ['e'] = { 'Edit' },
                }
            },
        },
    }

    wk.register(mappings, { prefix = '<leader>' })
end
