"onedark.vim override: Set a custom background color in the terminal
if (has("autocmd") && !has("gui_running"))
augroup colors
    autocmd!
    let s:background = { "gui": "", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
augroup END
endif

let g:onedark_terminal_italics=1
colorscheme onedark

" airline
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_statusline_ontop=1

