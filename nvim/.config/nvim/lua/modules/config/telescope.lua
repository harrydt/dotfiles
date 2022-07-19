-- https://github.com/nvim-telescope/telescope.nvim#telescope-defaults
return function()
    local telescope = require('telescope')
    -- Required to close with ESC in insert mode
    local actions = require('telescope.actions')

    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
        defaults = {
            find_command = {
                'rg',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                -- '--hidden', -- search hidden files too
                -- '--files', -- from old init.vim
                -- '--no-ignore-vcs', -- from old init.vim
            },
            initial_mode = 'insert',
            selection_strategy = 'reset',
            sorting_strategy = 'descending',
            layout_strategy = 'horizontal',
            prompt_prefix = '> ',
            layout_config = {
                prompt_position = 'bottom',
                horizontal = {
                    mirror = false,
                    preview_width = 0.6,
                },
            },
            file_sorter = require('telescope.sorters').get_fuzzy_file,
            file_ignore_patterns = { "^%.git/", "^node_modules/", "^__pycache__/" },
            generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
            winblend = 0,
            scroll_strategy = 'cycle',
            border = {},
            borderchars = {
                '─',
                '│',
                '─',
                '│',
                '╭',
                '╮',
                '╯',
                '╰',
            },
            color_devicons = true,
            use_less = true,
            set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
            mappings = {
                i = {
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-q>'] = actions.smart_send_to_qflist
                        + actions.open_qflist,
                    ['<Leader>f'] = actions.close, -- works like a toggle, sometimes can be buggy
                    ['<CR>'] = actions.select_default + actions.center,
                },
                n = {
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-q>'] = actions.smart_send_to_qflist
                        + actions.open_qflist,
                },
            },
            -- path_display={"smart"},
        },
        telescope.load_extension('fzf'),
        telescope.load_extension('vimwiki'),
        telescope.load_extension('file_browser')
    })
end
