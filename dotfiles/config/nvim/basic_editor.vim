" Basic navigation customizations and notes
"
" Helpful Notes:
" - To copy a line: `yy`, and to paste it below `p`
" - To paste the line above `P`
" - o - add a line below this line and enter insert mode
" - O - add a line above this line and enter insert mode
" - u - Undo last edit
" - U - undo entire line - restore line
" - Redo: `C-R`
" - r - replace character at cursor
" - c{motion} - change - cw - change word, ce - change to end
" - . - repeat last edit
"
" - To cut and paste blocks
"   1. Use visual-block mode `V`
"   2. Select the region
"   3. Cut using `d`, copy using `y`
"   4. Then paste using `p` (after), or `P` (before)
"
" - dw - delete whitespace up to the next word
" - de - delete from the cursor to the end of the word
"
" - multiline editing
"   C-v to enter visual mode, then I to insert, then esc esc to apply changes

" D - Delete under char until the end of the line, same as d$
" A - enter insert mode at the end of the line
" I - enter insert mode at the first non-white space character in the line
" i - insert at cursor
" a - insert after character on the cursor
" o - jump to the other end of the visual selection
" J - join lines
"
" daw - delete around word
" diw - delete inside word
" dap - delete around paragraph
" dip - delete inside paragraph
" da) - delete everything inside parentheses, including the parentheses
" di) - delete just what's inside the parentheses, or the nearest parens on the line
" =i{ - reformat inside of braces
"
" Some ideas for editor
" map <C-c> "+y
" map <S-Insert> "+p
"
" set alternative esc key
" For ideas: https://vim.fandom.com/wiki/Avoid_the_escape_key
imap <C-L> <Esc>
imap jk <Esc>
imap kj <Esc>
imap <C-X> <Esc>

" automatically exit insert mode when using up and down arrows
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" Emacs shortcut - Ctrl-K to delete to the end of the line
" Use emacs bindings when in insert mode
" Try to use vim bindings when in normal mode
inoremap <c-k> <esc><esc>ld$a
nnoremap <c-k> d$

" Mimic Emacs Line Editing
" emacs like shortcuts
inoremap <C-A> <Home>
inoremap <C-E> <End>
"nnoremap <C-A> <Home>
"nnoremap <C-E> <End>

" modify escape to leave the cursor where it was on exit from insert mode
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
