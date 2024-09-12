if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }


Plug 'ggandor/leap-ast.nvim'
Plug 'ggandor/leap.nvim'
Plug 'nvim-treesitter/nvim-treesitter' ", {'do': ':TSUpdate'}
"Plug 'neovim/nvim-lspconfig'

" FZF
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }


" Vimux
Plug 'preservim/vimux'

" which key
Plug 'liuchengxu/vim-which-key'

" powerline
" airpline (powerline alternative)
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" Themes
 "https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'
"Plug 'christianchiarulli/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

" Tabline
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'

" COMMENTING
" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/gcmt/wildfire.vim
Plug 'gcmt/wildfire.vim'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
"
""""""""""""""""""""""""""
" Markdown Preview
""""""""""""""""""""""""""
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" don't close the browser when navigating between tabs
let g:mkdp_auto_close = 0

call plug#end()

" Final mappings
source ~/.config/nvim/vars.vim
source ~/.config/nvim/basic_editor.vim
source ~/.config/nvim/basic_nav.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins/whichkey.vim
source ~/.config/nvim/plugins/search.vim
source ~/.config/nvim/plugins/highlight_cursor.vim
"source ~/.config/nvim/plugins/onedark.vim
source ~/.config/nvim/plugins/theme.vim
"source ~/.config/nvim/plugins/whichkey.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/hardmode.vim
source ~/.config/nvim/plugins/rust.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/wildfire.vim
source ~/.config/nvim/plugins/vimux.vim
source ~/.config/nvim/plugins/leap.vim

" END OF INIT


" don't conceal anything (super annoying when using Markdown)
"set conceallevel=0
"let g:indentLine_conceallevel = 0
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indentLine_setConceal = 0

" enter secure mode, this should go at the end of the init file
set secure
