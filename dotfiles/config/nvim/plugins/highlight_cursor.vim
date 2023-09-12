" highlight cursor

set cursorcolumn

"autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

" change cursor color on insert

" Enable CursorLine
set cursorline

" Default Colors for CursorLine
highlight  CursorLine ctermbg=11 guibg=s:cursor_grey ctermfg=None

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=11 ctermfg=Black guibg=#ffff00 guifg=#000000

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=11 ctermfg=None guibg=#2C323C guifg=None

" Cursor Settings
"
" get the cursor to blink in insert mode
"
" default
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
"
" Custom cursor
" Blinking Cursor is not yet implemented on alacritty
" but it does work in iTerm2
set guicursor=n-v-c-sm:ver100,
	\i-ci-ve:block-blinkon100-DiffDelete,
	\r-cr-o:hor100-blinkon100

