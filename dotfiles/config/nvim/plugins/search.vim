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
nnoremap <silent> <leader>B :Buffers<CR>
let g:which_key_map.b = [ ':FzfLua buffers',  'search buffer list with FZF' ]
"nnoremap <silent> <leader>b :Lines<CR>

" Files
" Ctrl-F - search for a file
"map <C-f> <Esc><Esc>:Files!<CR>
"nnoremap <silent> <leader>f :FzfLua files<CR>
let g:which_key_map.g = [ ':FzfLua git_files',  'search files with FZF' ]
let g:which_key_map.f = [ ':FzfLua files',  'search files with FZF' ]

" Ctrl-L - search in the current buffer
"map <C-l>                    <Esc><Esc>:BLines<CR>
"nnoremap <silent> <leader>b  <Esc><Esc>:BLines<CR>
let g:which_key_map.B = [ ':FzfLua blines',  'search lines in current buffer with FZF' ]
let g:which_key_map.e = [ ':FzfLua resume',  'resume search' ]

" Telescope
nnoremap <leader>mf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>mg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>mb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>mh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>mlr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>mli <cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>
nnoremap <leader>mlo <cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>
nnoremap <leader>mlx <cmd>lua require('telescope.builtin').diagnostics()<cr>
nnoremap <leader>mli <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>mld <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" Use silver searcher - ignore git related files, include hidden files
"let $FZF_DEFAULT_COMMAND = 'ag -p --hidden --ignore-dir=.git -g ""'
"let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
"let $FZF_DEFAULT_COMMAND="rg --files --hidden"
"
" Initialize configuration dictionary
"let g:fzf_vim = {}

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~100%', 'window': { 'width': 1, 'height': 1,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

"let g:fzf_vim.preview_window = 'top'

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

lua << EOF
require'fzf-lua'.setup {
  winopts = {
    height = 1,
    width = 1,
  },
  preview = {
    vertical = "up:66%",
    horizontal = "right:66%",
  }
}
EOF