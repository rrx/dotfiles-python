" startify
nnoremap <leader>S :Startify<CR>

let g:startify_fortune_use_unicode = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]
