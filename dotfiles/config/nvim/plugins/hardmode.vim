" Hardmode settings
" Training yourself to not use the arrow keys
" See: http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
" https://github.com/wikitopian/hardmode
"nnoremap <leader>h <esc>:call ToggleHardMode()<cr>

"let g:which_key_map.h = 'hardmode'
let g:HardMode_level='wannabe'

" enable hardmode by default
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
