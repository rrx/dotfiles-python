let g:coc_global_extensions = ['coc-sh', 'coc-json', 'coc-tsserver', 'coc-git', 'coc-yaml', 'coc-rust-analyzer', 'coc-pyls', 'coc-snippets', 'coc-vimlsp', 'coc-yank', 'coc-groovy']

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" trigger completion
inoremap <silent><expr> <c-o> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call   CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"nmap <silent> <leader>lc          :call LanguageClient_contextMenu()<CR>
"nmap <silent>K                    :call LanguageClient_textDocument_hover()<CR>
"nmap <silent> <leader>ld          :call LanguageClient_textDocument_definition()<CR>
"nmap <silent> <leader>la          :call LanguageClient_textDocument_codeAction()<CR>
nmap <silent> <leader>la           <Plug>(code-action)
nmap <silent> <leader>lq           <Plug>(code-fix-current)
"nmap <silent> <leader>lr          :call LanguageClient_textDocument_rename()<CR>
nmap <silent> <leader>lr           <Plug>(coc-rename) 
xmap <silent> <leader>li           <Plug>(coc-format-selected)
nmap <silent> <leader>li           <Plug>(coc-format-selected)
xmap <silent> <leader>ls           <Plug>(coc-range-select)
nmap <silent> <leader>ls           <Plug>(coc-range-select)
"vmap <silent> <leader>li          :call LanguageClient_textDocument_rangeFormatting()<CR>
"nmap <silent> <leader>lj          :call LanguageClient_textDocument_references()<CR>
"nmap <silent> <leader>lt          :call LanguageClient_textDocument_typeDefintion()<CR>
"nmap <silent> <leader>li          :call LanguageClient_textDocument_implementation()<CR>
"nmap <silent> <leader>lx          :call LanguageClient_textDocument_codeLens()<CR>
"nmap <silent> <leader>ls          :call LanguageClient_textDocument_documentSymbol()<CR>
"nmap <silent> <leader>lS          :call LanguageClient_workspace_symbol()<CR>
""imap <silent> <C-O>               :call LanguageClient_textDocument_completion()<CR>
"nmap <silent> <leader>lI          :call LanguageClient_textDocument_formatting()<CR>
"nmap <silent> <leader>lh          :call LanguageClient_textDocument_documentHighlight()<CR>
"nmap <silent> <leader>l<CR>       :call LanguageClient_clearDocumentHighlight()<CR>

"let $RUST_BACKTRACE = 1
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_virtualTextPrefix = ''
"let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
"let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
