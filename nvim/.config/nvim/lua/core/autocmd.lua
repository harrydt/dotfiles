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
        autocmd FileType fugitiveblame nmap <buffer> <ESC> gq
    augroup END

    augroup BQF
      autocmd!
      au FileType qf nnoremap <ESC> :cclose<CR>
    augroup END
]])
