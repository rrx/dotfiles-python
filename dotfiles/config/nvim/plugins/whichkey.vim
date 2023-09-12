" https://github.com/liuchengxu/vim-which-key

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

nnoremap <localleader> :<c-u>WhichKey  '\'<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  '\'<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=100

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" no floating window
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Human readable notes on leader keybindings
let g:which_key_map.R = 'Reload vim config and install plugins'
let g:which_key_map.S = [':Startify','Startify']

" s is for source
let g:which_key_map.s = {
            \ 'name': '+source',
            \ 'v': [':source ~/.config/nvim/init.vim', 'Source vimrc'],
            \ 'c': [':source %', 'Source current file']
            \ }

let g:which_key_map.d = {
      \ 'name': 'Directory',
      \ 'o': [':e %:h', 'Open directory of current file'],
      \ 'p': [':e getcwd()', 'Open directory of current path']
      \ }

call which_key#register('<Space>', "g:which_key_map")
