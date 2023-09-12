" Rust Racer
"let g:racer_experimental_completer = 1
"let g:racer_insert_paren = 1

" run rustfmt on save automatically
"let g:rustfmt_autosave = 1

"augroup Racer
    "autocmd!
    "autocmd FileType rust nmap <buffer> gd          <Plug>(rust-def)
    "autocmd FileType rust nmap <buffer> gs          <Plug>(rust-def-split)
    "autocmd FileType rust nmap <buffer> gx          <Plug>(rust-def-vertical)
    "autocmd FileType rust nmap <buffer> gt          <Plug>(rust-def-tab)
    "autocmd FileType rust nmap <buffer> <leader>gd  <Plug>(rust-doc)
    "autocmd FileType rust nmap <buffer> K           <Plug>(rust-doc)
"augroup END

if g:config.ide_languageclient
    autocmd FileType rust :call GoLanguageClient()
    autocmd FileType rust nmap <buffer> <silent> <leader>lc <Plug>(lcn-menu)
    autocmd FileType rust nmap <buffer> <silent>K           <Plug>(lcn-hover)
    autocmd FileType rust nmap <buffer> <silent>gd          <Plug>(lcn-definition)
    autocmd FileType rust nmap <buffer> <silent>lr          <Plug>(lcn-rename)
endif


if g:config.ide_coc
    autocmd FileType rust :call GoCoc()
    autocmd FileType rust :call GoCocComplete()
endif

