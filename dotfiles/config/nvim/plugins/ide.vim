" Configuration related to language servers
if has('macunix')
    "let g:python3_host_prog='/usr/bin/python3'
    "let g:python_host_prog='/usr/bin/python'
    "let g:python3_host_prog='python3' "'~/.asdf/shims/python3'
    "let g:python_host_prog='python' "'~/.asdf/shims/python'
endif

if has('unix')
    let g:python3_host_prog='/usr/bin/python3'
    let g:python_host_prog='/usr/bin/python'
endif


fun! GoLsp()
    imap <buffer> <c-space> <Plug>(asyncomplete_force_refresh)
    " map tab, but only for insert mode
    inoremap <buffer> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <buffer> <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
    nnoremap <buffer> <silent> K :LspHover<CR>
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
endfun

fun! GoLanguageClient()
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'],
                \ 'groovy': ['~/.asdf/shims/java', '~/projects/groovy-language-server/build/libs/groovy-language-server-all.jar'],
                \ }

    "'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "'python': ['/usr/local/bin/pyls'],
    "'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

    " Language Server Bindings
    "nnoremap <buffer> <silent> <leader><l> :call LanguageClient_contextMenu()<CR>
    " Or map each action separately
    "nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    "nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    "nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "nnoremap <buffer> <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
endfun

if g:config.ide_neomake
    " Neomake
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 500ms; no delay when writing).
    call neomake#configure#automake('nrwi', 500)
endif

if g:config.ide_languageclient
    autocmd FileType vim :call GoLanguageClient()
endif

if g:config.ide_vimlsp
    autocmd FileType vim,sh,zsh :call GoLsp()
endif

if g:config.ide_coc
    autocmd FileType vim,sh,zsh :call GoCoc()
    autocmd FileType vim,sh,zsh :call GoCocComplete()
    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

autocmd FileType typescript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()
autocmd FileType cpp,cxx,h,hpp,c :call GoCocComplete()

set completeopt=menuone,preview,noinsert,noselect

" setup keybindings for ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


