let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines','trim_whitespace'],
\   'go': ['goimports'],
\   'dockerfile': ['hadolint'],
\   'bash': ['shfmt'],
\   'bzl': ['buildifier'],
\}
