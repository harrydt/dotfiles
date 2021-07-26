vim.cmd([[
    "" Only show cursorline on current window
    augroup cursorline
        autocmd!
        autocmd WinEnter,BufEnter * setlocal cursorline
        autocmd WinLeave,BufLeave * setlocal nocursorline
    augroup END

    augroup auto_compile_packer
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup END
]])
