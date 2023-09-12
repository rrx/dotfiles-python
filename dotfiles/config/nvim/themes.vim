" Theme related configuration

if g:config.theme == 'onedark'
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
else

    colorscheme palenight
    "colorscheme aurora
    "colorscheme wal
    "colorscheme slate

    " Gruvbox
    "let g:gruvbox_contrast_dark='hard'
    "colorscheme gruvbox


endif

if g:config.highlight_cursor

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
endif

if g:config.theme_statusline == 'airline'
    " airline
    "
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1

    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    "let g:airline_statusline_ontop=1
elseif g:config.theme_statusline == 'eleline'
    let g:airline_powerline_fonts = 1
    let g:eleline_powerline_fonts = 1
endif
