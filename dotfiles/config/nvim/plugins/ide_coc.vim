
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCocComplete()
    "let g:coc_snippet_next = '<tab>'
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>":
                \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()
    inoremap <buffer> <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
endfun

fun! GoCoc()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <buffer> <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <buffer> <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <buffer> <silent> gd <Plug>(coc-definition)
    nmap <buffer> <silent> gy <Plug>(coc-type-definition)
    nmap <buffer> <silent> gi <Plug>(coc-implementation)
    nmap <buffer> <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        "if (index(['vim','help'], &filetype) >= 0)
            "execute 'h '.expand('<cword>')
        "else
            call CocActionAsync('doHover')
        "endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <buffer> <leader>lr <Plug>(coc-rename)

    " Formatting selected code.
    xmap <buffer> <leader>lf  <Plug>(coc-format-selected)
    nmap <buffer> <leader>lf  <Plug>(coc-format-selected)

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>la  <Plug>(coc-codeaction-selected)
    nmap <leader>la  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>lA  <Plug>(coc-codeaction)

endfun

autocmd FileType yaml :call GoCoc()
autocmd FileType yaml :call GoCocComplete()
autocmd FileType helm :call GoCoc()
autocmd FileType helm :call GoCocComplete()

