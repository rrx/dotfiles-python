" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'yaml': ['yamllint'],
\}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
