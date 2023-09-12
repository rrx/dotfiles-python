let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rust-analyzer'],
	\ 'groovy': ['~/.asdf/shims/java', '~/projects/groovy-language-server/build/libs/groovy-language-server-all.jar'],
	\ }


augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
    "autocmd FileType rust nmap <buffer> <silent> <leader>lc <Plug>(lcn-menu)
    "autocmd FileType rust nmap <buffer> <silent>K           <Plug>(lcn-hover)
    "autocmd FileType rust nmap <buffer> <silent>gd          <Plug>(lcn-definition)
    "autocmd FileType rust nmap <buffer> <silent>lr          <Plug>(lcn-rename)
augroup END

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

