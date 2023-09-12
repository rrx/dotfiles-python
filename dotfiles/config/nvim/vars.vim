set shell=/bin/zsh

" add line numbers generally
set number

" Required for operations modifying multiple buffers like rename.
" allows you to switch buffers without having to save their changes
set hidden

" set per-project .vimrc files
set exrc

" default encoding
set encoding=utf-8

" ask for confirmation, rather than an error
set confirm

" enable mouse in iterm2
" `a` enables mouse select
set mouse=nicra

" copy/paste from + register (system clipboard)
set clipboard=unnamedplus

" no case sensative search unless uppercase is present
set ignorecase
set smartcase

" use RGB colors
set termguicolors

" Backup settings
"set nobackup
set writebackup
if !isdirectory($HOME."/.local/share/nvim/undo")
    call mkdir($HOME."/.local/share/nvim/undo", "", 0770)
endif
if !isdirectory($HOME."/.local/share/nvim/backup")
    call mkdir($HOME."/.local/share/nvim/backup", "", 0770)
endif
set undodir=~/.local/share/nvim/undo
set undofile
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap

" Don't pass messages to |ins-completion-menu|.
set shortmess=atOIc

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=1

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" set auto indent
set autoindent
set smartindent
filetype plugin indent on

" disable autowrap generallky
set tw=0

syntax on

" disable word break
set textwidth=0

" When git complains about line endings with this message:
" \ No newline at end of file
" the easier fix is to use the following VIM command:
set noendofline binary

