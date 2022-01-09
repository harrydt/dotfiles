vim.cmd([[
    augroup cursorline
        autocmd!
        autocmd WinEnter,BufEnter * setlocal cursorline
        autocmd WinLeave,BufLeave * setlocal nocursorline
    augroup END
    
    augroup autoread
        set autoread
        autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
        autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup end

    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
    augroup END

    augroup fugitve_gitblame_q
        autocmd FileType fugitiveblame nmap <buffer> q gq
    augroup END

    augroup bqf_q
        autocmd FileType qf nnoremap <buffer> q :cclose<CR>
    augroup END

    augroup format_on_save
        autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
        autocmd BufWritePre *.go.in lua vim.lsp.buf.formatting_sync(nil, 1000)
    augroup
]])
