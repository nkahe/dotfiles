" Plugins {{{1
" -- NERDTree --
" If NERDTree is installed, bind it to C-o to explore files.
"if exists(':NERDTree')

  " We need to set insertmode off, because otherwise NERDTree won't work.
  " It's set back on via autocmd.
  " inoremap <silent> <C-o> <C-o>:set noinsertmode \| :NERDTreeFocus<CR>
  " snoremap <silent> <C-o> <C-o>:set noinsertmode \| :NERDTreeFocus<CR>

  " automatically close NerdTree when you open a file:
  let NERDTreeQuitOnOpen = 1

  " Automatically delete the buffer of the file you just deleted with NerdTree:
  let NERDTreeAutoDeleteBuffer = 1
"else 
  " Else builtin netrw is used. 
"  inoremap <silent> <C-o> <C-o>:set noinsertmode \| :Explore<CR>
"  snoremap <silent> <C-o> <C-o>:set noinsertmode \| :Explore<CR>
"endif

" Settings {{{1

" Only Insert mode is used. You can override this by 'set noinsertmode' or
" 'set noim' if needed. Insertmode is set on after reading a buffer.
" (see Autocommands).
set insertmode

" Set insertmode on after reading a buffer which may happen when using
" plugins.
" NOTE: tämä pelkästään ei riitä pitämään insert moodissa, koska jos avaa
" ctrlp tai nerdtree ja sulkee ikkunan, niin on edelleen normal modessa.
autocmd BufReadPost * set insertmode

" Set insert mode when buffer is made hidden like when leaving plugin -window.
autocmd BufHidden * set insertmode

" Functions {{{1

" **HUOM!** Näitä ei voi bindata erikseen: C-i & tab, Enter & C-M, Esc & Ctrl-[.
" Ei kannata bindata myöskään C-o.

" Map a key to do one command in Normal mode (C-o) while in Insert and Select mode.
function! Ismap(key, command)
  exec 'inoremap' a:key '<C-o>' . a:command
  exec 'snoremap' a:key '<esc><C-o>' . a:command
endfunction

" Same but perform identical mappings.
function! Doublemap(key, command)
  exec 'inoremap' a:key '<C-o>' . a:command
  exec 'snoremap' a:key '<C-o>' . a:command
endfunction

" Basics {{{1

" [i|s]noremap = map a key in Insert|Select mode without doing remapping.
" C-o = Execute one command in Normal mode and return to Insert mode.
" For Select mode we usually need to add <esc> to escape into Insert mode,
" because C-o doesn't work in Select mode.

function! InsertMode()
  set noinsertmode
endfunction

inoremap <esc> <C-o>:call InsertMode()<CR>

call Ismap('<C-e>',':')              " Execute one Command in Command mode.
call Ismap('<C-A-s>',':write<CR>')   " Save(write)
call Ismap('<C-q>',':quitall<CR>')   " Quit. Alternative: F10 (see Functions keys).

" Navigation in text {{{1

" Search. If text is selected, insert it.
inoremap <C-f> <C-o>/
snoremap <C-f> <C-o>y/<C-r>"

" Replace. If text is selected, insert it.
inoremap <C-r> <C-o>:%s/
snoremap <C-r> <C-o>y:%s/<C-r>"/

call Ismap('<C-g>',':')       " Goto line (enter linenumber).

call Doublemap('<A-a>','za')  " Toggle folding ('za' in (Neo)Vim)"

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the wrapped portion. This fixes that.
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>

if !has('nvim')
" gg0 ja G$ menis täysin tiedoston alkuun ja loppuun, mutta eivät toimi
" jostain syystä.
  call Doublemap('<C-Home>','gg')  " To beginning of file
  call Doublemap('<C-End>','G')    " To end of file
endif

" Go to next / previous line break (paragraph)
inoremap <C-Up> <C-o>(
snoremap <C-Up> <C-o>(

" Ctrl-Down = Go to previous line break (paragraph)
inoremap <C-Down> <C-o>)
snoremap <C-Down> <C-o>)

" Editing text {{{1

call Ismap('<C-j>','J')        " Join lines
call Doublemap('<C-k>','dd')   " Remove line. TODO: selectissä ei ihan toimi.

" Koitan, jos sais Replace:n kysymään ensin haettavaa tekstiä ja sitten
" korvattavaa.
function! Replace()
  let curline = getline('.')
  call inputsave()
  let find_str = input('Find: ')
  let replace_str = input('Replace with: ')
  call inputrestore()
  " Save cursor position
  let l:save = winsaveview()
  %s/' . find_str'/' . replace_str'/cg
  " Move cursor to original position
  call winrestview(l:save)
endfunction
" testi
inoremap <C-A-r> <C-o>:call Replace()<CR>

" Ctrl/alt-Backspace = Delete previous word
" Usually terminals send ^H when pressing C-BS so that is mapped too.
" In Vim, openSUSE-defaults.vim is needed for this to work.
" TODO: tee for -luuppi C-BS, A-BS, C-h
"for i in ['<C-BS>', '<A-BS>', '<C-h>'] 
"  inoremap i <esc>"_dbxi
"  snoremap i <esc>"_dbxi
"endfor

inoremap <C-BS> <esc>"_dbxi
snoremap <C-BS> <esc>"_dbxi
inoremap <A-BS> <esc>"_dbxi
snoremap <A-BS> <esc>"_dbxi
inoremap <C-h> <esc>"_dbxi
snoremap <C-h> <esc>"_dbxi

call Doublemap('<C-del>','dw')   " Delete next word
 
" Function keys {{{1

" Find next
inoremap <F3> <C-o>n

" In select mode find next instance of selected text
snoremap <F3> <C-o>y/<C-r>"<CR>

" Shift-F3 = Find previous. FIXME : Ei toimi.
" inoremap <S-F3> <C-o>p
"imap ^[02R <C-o>p
"imap 02R <C-o>p
"imap <esc>02R <C-o>p

" F4 = FIXME: laita toggle trailing spaces.
" Show trailing white spaces as dots. TODO: saa tabit näkymäään merkkeinä.
" set list
" exec "set listchars=trail:\uB7"

" Open NERDTree.
" TODO:
" - Kuin poistuu NERD:stä, niin mene Insert-modeen.
" - testaa, onko NERDTree sourcetettu. jos ei, käytä
" Vimin default tiedoston aukaisua. 
" - saiko, että F7:lla poistuu?
" - Välillä NERDTreestä poistuttaessa jää Normal-modeen.

"if exists(":NERDTree")
"  inoremap <F7> <C-o>:NERDTreeFocus<CR>
"  snoremap <F7> <esc> :NERDTreeTabsToggle<CR>
"endif

" Open terminal.
" FIXME: Terminaalista poistuessa menee normal-tilaan.
call Ismap('<F9>',':terminal<CR>')  

" Quit (alternative: Ctrl-Q). Similar to TUI apps such as htop and Midnight Commander.
call Ismap('<F10>',':quitall<CR>')

" Tabs, windows, splits {{{1

" TODO : pitäiskö enew olla eri komento? jos avaa splitissä?
call Ismap('<silent> <C-n>',':enew<CR>')        " Open new file in new tab
call Ismap('<silent> <C-t>',':tabnew<CR>')      " New tab
call Ismap('<silent> <C-w>',':tabclose<CR>')    " Close tab
call Ismap('<silent> <A-Right>',':tabn<CR>')    " Next tab
call Ismap('<silent> <A-Left>',':tabp<CR>')     " Previous tab

" Close current window / split.
call Ismap('<A-c>',':close<CR>')
nnoremap <A-c>, ':close<CR>')

" H(o)rizontal and V(e)rtical splits
call Ismap('<A-o>',':split<CR>')
call Ismap('<A-e>',':vsplit<CR>')

" Alt-<direction> to switch split.
" Määrittelin omat eri tavalla. kts "Omat."
"call Ismap('<A-i>','<C-w>i')
"call Ismap('<A-k>','<C-w>k')
"call Ismap('<A-j>','<C-w>j')
"call Ismap('<A-l>','<C-w>ö')

" Command mode {{{1

" Paste selected text to command line.
snoremap <C-l> <C-o>y:<C-r>"

" Omat {{{1

" Alt-<suunta> vaihtaa ikkunaa. Missä suunta on i:up, j:left, k:down,l:right
" oletus käyttää tavallisia Vimin: hjlk -suuntia.
call Ismap('<A-i>','<C-w>k')
call Ismap('<A-k>','<C-w>j')
call Ismap('<A-j>','<C-w>h')
call Ismap('<A-l>','<C-w>l')
