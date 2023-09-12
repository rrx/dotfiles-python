" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Make Ranger to be hidden after picking a file
"let g:rnvimr_pick_enable = 1

nnoremap <space>r :RnvimrToggle<CR>
" adjust size of ranger when it's open
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
" quickly get out of ranger, this doesn't work, because others use terminal
" specifically it wrecks fzf
"tnoremap <silent> <ESC> <C-\><C-n>:RnvimrToggle<CR>


" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 0
