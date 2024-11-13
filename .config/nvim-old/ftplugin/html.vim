" Enable ESLint only for JavaScript.
let b:ale_linters = ['htmlhint', 'stylelint', 'php', 'phan']

" Fix files with ESLint.
let b:ale_fixers = ['htmlhint', 'stylelint', 'php', 'phan']

let b:ale_php_php_executable = '/usr/bin/php'
let b:ale_php_phan_executable = '/home/henri/.config/composer/vendor/phan/phan/phan_client'
let b:ale_php_phan_use_client = 1
let ale_php_langserver_use_global = 1

set colorcolumn=100

" Enable HTML syntax highlighting inside strings:
let php_htmlInStrings = 1
