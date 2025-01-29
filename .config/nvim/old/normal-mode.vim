" Tämä sisältää asetukset, jotka sopii käytettäväksi, kun aiot käyttää Vim:ä normalmodessa.

" C-Q      Quit
" C-A-Z    Suspend (Neo)Vim to background.
" Normi komennot: Ctrl-X,C,Z,S,Q,F, Ctrl-BS

" # Tabs & Windows
" Alt-left/right   Next / previous tab
" C-T     New tab
" C-W     Close tab
" Alt-C   Close window / split
" Alt-O   Split horizontally
" Alt-E   Split vertically
" Alt-<HJKL>  Move to window of direction.

" # Function keys
" F1      Search help for selected text.
" F2      Open file explorer
" F3      Find next
" F4      Avaa valikko. Tab:illa näkee vaihtoehdot.
" Ct-F4   Sulje
" F5      Reload file
" F7      Show files (NERDTree)
" F8      Toggle pastemode
" F9      Open terminal
" F11     Toggle Line numbers
" F12     Load settings


" Escape insert mode without delay.
"   Jotkut kahden näppäimen yhdistelmät juten jf ei toiminut tämän jälkeen.
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
   autocmd!
   au InsertEnter * set timeoutlen=0
   au InsertLeave * set timeoutlen=1000
   augroup END
endif

" When using always Insert mode:
" This is needed for Vim to not open folds when moving cursor pass closed folds in Insert mode.
" "Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows."
" (from http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text )
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

noremap <esc>e ge
noremap <esc>E gE

" Disable Ex-Mode
nnoremap Q <nop>

" C-A-Z = alkuperäienen C-z
nnoremap <esc><C-z> <C-z>

" Find previous
nmap ^[O2R p
nmap O2R p
nmap <esc>O2R p

noremap <F5> :edit!
nnoremap <F9> :terminal<CR> 

" i, j ja k kursorinäppäimiksi.
" Use i=up, j=left, k=down, l=right
" More one line up/down in a wrapped line.
noremap i gk
noremap k gj
map j h
noremap gk j
noremap gi k

vnoremap i gk
vnoremap j h
vnoremap k gj

" Koska i nyt insert -> up, niin pitää korjata tekstiobjektit, ettei i:ä
" lasketa liikkeeksi näissä.
nnoremap di di
nnoremap ci ci
nnoremap yi yi
nnoremap vi vi

" A-rivin viimeisen merkin jälkeen. C-ö ei toiminu.
noremap <esc>ö A<space><esc>


" Misc bindings

nnoremap <C-f> /
nnoremap <C-Up> (
nnoremap <C-Down> )

noremap <C-del> dw
noremap <C-A-c> :quitall<CR>
noremap <C-q> :quitall<CR>

" Tabs and windows

nnoremap <silent> <A-o> :split<CR>
nnoremap <silent> <A-e> :vsplit<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <esc>[1;3D :tabn<CR>
nnoremap <esc>[1;3C :tabp<CR>
