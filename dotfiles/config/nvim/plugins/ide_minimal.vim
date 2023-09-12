" tame wildmenu
" This menu is used for command completion
set wildmenu
"set wildoptions=pum
" set transparency on wildmenu
set pumblend=20
" first tab: complete the longest common string, and invoke menu
" second tab: complete the first alternative, and cycle through
set wildmode=longest:full,full
"
"set completeopt=menuone,preview,noinsert,noselect
set completeopt=menu,preview,noinsert,noselect
set completeopt+=longest
"
let g:indentLine_char = '▏'

" proper syntax highlighting for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd FileType vim :IndentGuidesEnable
let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=lightgrey
hi IndentGuidesEven ctermbg=lightgrey

fun! GoLanguageClient()
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'],
                \ 'groovy': ['~/.asdf/shims/java', '~/projects/groovy-language-server/build/libs/groovy-language-server-all.jar'],
                \ }

    " Language Server Bindings
    "nnoremap <buffer> <silent> <leader><l> :call LanguageClient_contextMenu()<CR>
    " Or map each action separately
    "nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    "nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    "nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "nnoremap <buffer> <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
endfun

if g:config.ide_languageclient
    autocmd FileType vim  :call GoLanguageClient()
endif

