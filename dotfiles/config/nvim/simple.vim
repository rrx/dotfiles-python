source ~/.config/nvim/plugins.vim

colorscheme delek
set clipboard=unnamed

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set ruler
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set backspace=indent,eol,start

" Set leader to space bar
let mapleader = " "

inoremap jk <Esc>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Rerun last command
nnoremap <Leader>vl :VimuxRunLastCommand <CR>
nnoremap <Leader>r :VimuxRunLastCommand <CR>
" Inspect runner
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <leader>vz :VimuxZoomRunner<CR>

" save in insert mode, and go back to normal
inoremap <C-S> <Esc>:w<CR>
" shortcut for save
nnoremap <C-S> :w<CR>
vnoremap <C-S> <Esc>:w<CR>gv


