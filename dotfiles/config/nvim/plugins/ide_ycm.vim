
if g:config.ide_ycm
    " ymc related settings
    "
    " Enable debugging
    let g:ycm_keep_logfiles = 1
    let g:ycm_log_level = 'debug'

    " Use deoplete.
    let g:deoplete#enable_at_startup = 0
endif


fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun
