" Set leader to space bar
let mapleader = " "

" local leader is backslash
let maplocalleader = "\\"

" Custom Mappings

" BUFFERS
" cycle through buffers using tab
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" go to previous file
nnoremap ga :e#<CR>

" map keys for moving between buffers, including terminals
"nnoremap <a-]> :bnext<CR>
"nnoremap <a-[> :bprevious<CR>
"tmap <a-[> <c-\><c-n><a-[>
"tmap <a-]> <c-\><c-n><a-]>
"tmap <C-W>w <c-\><c-n><c-w>w

" delete the current buffer and select the previous one
"nnoremap <leader>bq :<c-u>bp <bar> bd #<cr>

" kill buffer
command Bd bd
" Kill buffer with Space+q
nnoremap<silent> <Space>q :bdelete<CR>

" open links in external browser
nnoremap <silent>gx yiW:sil !open <c-r>" &<cr>

" QUIT
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Terminal mappings
" Navigate neovim + neovim terminal emulator with alt+direction
"tnoremap <c-h> <C-\><C-n><C-w>h
"tnoremap <c-j> <C-\><C-n><C-w>j
"tnoremap <c-k> <C-\><C-n><C-w>k
"tnoremap <c-l> <C-\><C-n><C-w>l

" easily escape terminal
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>

" Indentation
" fix indentation on the entire file and then go back to the original position
nnoremap <leader>i mzgg=G`zz

" remap up and down to handle wrapped lines
map j gj
map k gk

" Indent controls in visual mode
" Reselect text ater indent/unindent.
vnoremap < <gv
vnoremap > >gv
" Tab to indent in visual mode.
vnoremap <Tab> >gv
" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv


" word skips using control and left-right arrow
" â is <Alt-B>
inoremap â <C-Left>
" æ is <Alt-F>
inoremap æ <C-Right>

" inoremap <C-K> <Esc>lDa
" inoremap <C-U> <Esc>d0xi
" inoremap <C-Y> <Esc>pa

inoremap <C-_> <Esc>:undo<BR>a

" save in insert mode, stay in insert mode
inoremap <C-X><C-S> <Esc>:w<CR>a
" save in insert mode, and go back to normal
inoremap <C-S> <Esc>:w<CR>
" shortcut for save
nnoremap <C-S> :w<CR>
vnoremap <C-S> <Esc>:w<CR>gv


" source the current file
"nnoremap <leader>r :so %<CR>
nnoremap <leader>sc :so %<CR>
" source vim file and reload plugins
nnoremap <leader>R :so $MYVIMRC<CR>:PlugInstall<CR>

" edit/reload vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>


" toggle file explorer
"nnoremap <leader>e :NERDTreeToggleVCS<CR>

" locate the current buffer in nerdtree
"map  <leader>n  :NERDTreeFind<CR>

" Better window navigation
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"nnoremap <C-M-Up> <C-w>k
"nnoremap <C-M-Down> <C-w>j

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
"nnoremap <M-w><	  :resize -2<CR>
"nnoremap <M-w>>	  wresize +2<CR>

"nnoremap <C-w-lt>  <C-w>h
"nnoremap <C-w-gt>  <C-w>l


" lazy docker
" Lazydocker
"nnoremap <silent> <Leader>ld :call ToggleLazyDocker()<CR>

" Dump mappings to file
" :redir! > vim_keys.txt
" :silent verbose map
" :redir END
"
" function! ShowTerm2()
"     call system(">/dev/tty tput rmcup")
"     call input("")
"     call system(">/dev/tty tput smcup")
"     redraw!
" endfunction
"
" function! ShowTerm()
"     silent !read -sN 1
"     redraw!
" endfunction
"
" map [= :call ShowTerm()<CR>
"
" Git
"
" Git keybinds
" Git status
"nnoremap  <Leader>gs  :Gstatus<cr>
" Git diff in split window
"nnoremap  <Leader>gd  :Gdiffsplit<cr>
" Git commit
"nnoremap  <Leader>gc  :Gcommit<cr>
" Git push
"nnoremap  <Leader>gP  :Gpush<cr>
" Git pull
"nnoremap  <Leader>gp  :Gpull<cr>
" Git move
"nnoremap  <Leader>gm  :Gmove<cr>
" Git merge
"nnoremap  <Leader>gM  :Gmerge<cr>
" browse current file on web
"nnoremap  <Leader>gb  :Gbrowse<cr>
" browse current line on web
"nnoremap  <Leader>gbl  :CocCommand git.browserOpen<cr>
" View chunk information in preview window.
"nnoremap  <Leader>gh  :CocCommand git.chunkInfo<cr>
" View commit information in preview window.
"nnoremap  <Leader>gsc  :CocCommand git.showCommit<cr>
" Toggle git gutter sign columns
"nnoremap  <Leader>gg  :CocCommand git.toggleGutters<cr>
" Lazygit
"nnoremap <silent> <Leader>lg :call ToggleLazyGit()<CR>

" Markdown preview
"nmap <Leader>md <Plug>MarkdownPreviewToggle

" Nerd Commenter
nnoremap <leader>n :call nerdcommenter#Comment(0,"toggle")<cr>
" stay in visual mode if in visual mode
vnoremap <leader>n :call nerdcommenter#Comment(1,"toggle")<cr>gv
" map control+forward slash, for some reason the way to get that is `_`
" See: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
"nnoremap <C-_> :call nerdcommenter#Comment(1,"toggle")<cr>
"vnoremap <C-_> :call nerdcommenter#Comment(1,"toggle")<cr>gv
"inoremap <C-_> <Esc>:call nerdcommenter#Comment(1,"toggle")<cr>a

" open buffer with keybindings
nnoremap <leader>Y :redir! > /tmp/keys.txt<CR> \| :verbose map<CR> \| :redir END<CR> \| :e /tmp/keys.txt<CR>

" Schlepp
" https://github.com/zirrostig/vim-schlepp
"vnoremap Mk    <Plug>SchleppUp
"vmap <unique> <s+down>  <Plug>SchleppDown
"vmap <unique> <s+left>  <Plug>SchleppLeft
"vmap <unique> <s+right> <Plug>SchleppRight


"let g:Schlepp#allowSquishingLines = 1
"let g:Schlepp#allowSquishingBlock = 1
"xmap <C-j> <Plug>(textmanip-move-down)
"xmap <C-k> <Plug>(textmanip-move-up)
"xmap <C-h> <Plug>(textmanip-move-left)
"xmap <C-l> <Plug>(textmanip-move-right)
