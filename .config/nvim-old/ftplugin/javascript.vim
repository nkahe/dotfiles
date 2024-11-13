" set equalprg=

" ----------- ALE -----------

" tsserver is needed to get documentation etc aside of linting.
" Installed with npm package 'typescript'. Gives typescript
" errors.

let b:ale_linters = ['eslint']
" let b:ale_linters = ['tsserver','eslint']

let b:ale_javascript_eslint_executable = '/usr/local/bin/eslint'

" let b:ale_javascript_eslint_use_global = 1
let b:ale_fixers = ['eslint']

" Vim-javascript: gives an error if this foldmethod is not set.
setlocal foldmethod=syntax foldnestmax=1

" --------- Conceal -------------

" If want to show symbols instead of actual code
" set conceallevel=1
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"

"vi: syntax=vim 
