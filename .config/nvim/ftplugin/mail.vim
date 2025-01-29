" Mutt:ia käyttäessä ei rumia line breakeja.
setlocal fo+=aw
"
" We have setting that displays filename on terminal tab title. But we don't
" want to display useless temporary file name when compose message with Mutt.
"autocmd BufEnter * let &titlestring = 'mutt'
" set title

echom &filetype
