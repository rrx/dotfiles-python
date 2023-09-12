" See: https://www.bugsnag.com/blog/tmux-and-vim

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vnoremap <Leader>vs "vy:call VimuxSendText(@v)<cr><bar>:call VimuxSendKeys("Enter")<CR>

" Select current paragraph and send it to tmux
nnoremap <Leader>vs vip"vy:call VimuxSendText(@v)<bar>:call VimuxSendKeys("Enter")<cr>

" requires special mappings in terminal to make this work
map <s-cr> <Leader>vs

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>r :VimuxRunLastCommand <CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>


