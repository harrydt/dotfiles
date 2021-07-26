vim.cmd([[
    augroup cursorline
        autocmd!
        autocmd WinEnter,BufEnter * setlocal cursorline
        autocmd WinLeave,BufLeave * setlocal nocursorline
    augroup END
]])
