" File search settings

" FZF bindings
" Launch with C-P
"nnoremap <silent> <C-p> :Clap<CR>
"let g:which_key_map['p'] = [':Clap',      'Clap']

"nnoremap <silent> <C-p> :FZF -m<CR>
"nnoremap <silent> <leader>/ :Rg <CR>

" extra ignores in ~/.agignore
let g:which_key_map['/'] = [':Ag',      'Search with silversearcher']

" use FZF to read buffers and search lines
"nnoremap <silent> <leader>B :Buffers<CR>
let g:which_key_map.B = [ ':Buffers',  'search buffer list with FZF' ]
"nnoremap <silent> <leader>b :Lines<CR>

" Files
" Ctrl-F - search for a file
"map <C-f> <Esc><Esc>:Files!<CR>
"nnoremap <silent> <leader>f :Files<CR>
let g:which_key_map.F = [ ':GFiles',  'search files with FZF' ]
let g:which_key_map.f = [ ':Files',  'search files with FZF' ]

" Ctrl-L - search in the current buffer
"map <C-l>                    <Esc><Esc>:BLines<CR>
"nnoremap <silent> <leader>b  <Esc><Esc>:BLines<CR>
let g:which_key_map.b = [ ':BLines',  'search lines in current buffer with FZF' ]

" Use silver searcher - ignore git related files, include hidden files
"let $FZF_DEFAULT_COMMAND = 'ag -p --hidden --ignore-dir=.git -g ""'
"let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
"let $FZF_DEFAULT_COMMAND="rg --files --hidden"

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
