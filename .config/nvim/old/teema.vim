" Nämä on vanhempia asetuksia, joita käytin ennen Lightlinea.

" Tabirivi, valittu. Vihreä
" hi TabLineSel ctermfg=256 ctermbg=40
" hi TabLine ctermfg=40 ctermbg=0
" Loppuosa tabiriviä.
" hi TabLineFill ctermfg=22 ctermbg=none

" Statusline
" hi StatusLine ctermbg=40 ctermfg=22  " Green
hi StatusLine ctermbg=39 ctermfg=17

" Black folding for Gvim.
hi Folded guibg=black

" Tabirivi, valittu.
hi TabLineSel ctermfg=17 ctermbg=45
" Passive tab
hi TabLine ctermfg=45 ctermbg=17
" Loppuosa tabiriviä.
hi TabLineFill ctermfg=17 ctermbg=none

" Format the status line
set statusline=Rivi:\ \%l          " line
set statusline+=\ \/\ \%L          " total line
set statusline+=\ \(%P)            " percent through file
set statusline+=\ \ \Sarake:\ \%c  " columns
set statusline+=\ \ \Tiedosto:\ \%F\  " file + path
set statusline+=%m%r%h%w              " flags: modified, read-only, help file
set statusline+=%=                    " Vaihda oikealle puolelle
set statusline+=Tyyppi:\ \%y

" Old Layout
" set statusline=
" set statusline+=\ %F\           " file + path
" set statusline+=%m%r%h%w        " flags: modified, read-only, help file
" set statusline+=%=              " Vaihda oikealle puolelle
" set statusline+=sarake:\ \%c    " column
" set statusline+=\ \rivi:\ \%l   " line
" set statusline+=\ \/\ \%L       " total lines
" set statusline+=\ \ \ \%P       " percent through file

