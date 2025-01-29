" Make (Neo)Vim behave like a pager. Use Normal mode and some similar
" keybindings as Less.
"
" Modified from script less.vim (comes with (Neo)Vim) by Bram Moolenaar.
"
" Evoked from vless bash script.

" 'you probably don't want to load ALE in pager mode at all... if you use
" vim-plug just Plug declaration for ALE under the condition for: not vimpager'

" If not reading from stdin, skip files that can't be read.
" Exit if there is no file at all.
if argc() > 0
  let s:i = 0
  while 1
    if filereadable(argv(s:i))
      if s:i != 0
	sleep 3
      endif
      break
    endif
    if isdirectory(argv(s:i))
      echomsg "Skipping directory " . argv(s:i)
    elseif getftime(argv(s:i)) < 0
      echomsg "Skipping non-existing file " . argv(s:i)
    else
      echomsg "Skipping unreadable file " . argv(s:i)
    endif
    echo "\n"
    let s:i = s:i + 1
    if s:i == argc()
      quit
    endif
    next
  endwhile
endif

set noinsertmode   " Don't use insertmode by default.
set nomodifiable   " Can't modify the text

" When reading from stdin don't consider the file modified.
au VimEnter * set nomodified

" Used after each command: put cursor at end unless we use man-pages.
" There cursor can be placed on commands and open that page with 'K'.
if !(&filetype=='man')
  if &wrap
    noremap <SID>L L0:redraw<CR>
   au VimEnter * normal! L0
  else
   noremap <SID>L Lg0:redraw<CR>
   au VimEnter * normal! Lg0
  endif
endif

" Huom! Näitä ei voi bindata erikseen: Ctrl-i & tab, Enter & Ctrl-m, Esc & Ctrl-[. Ei kannata bindata myöskään C^O.

" [i|s]noremap = map a key in Insert|Select mode without doing remapping.
" C-o = Execute one command in Normal mode and return to Insert mode.
" For Select mode we usually need to add <esc> to escape to Insert mode,
" Because C-o doesn't work in Select mode.

" Command mode. (A-X is used in Emacs).
nnoremap <C-l> :
nnoremap <A-x> :

" Ctrl-n = New file. Open file in new tab. TODO : pitäiskö olla eri komento? jos avaa
" splitissä?
nnoremap <silent> <C-n> :enew<CR>

nmap <silent> <C-q> <C-o>:quitall<CR>
nmap <silent> q <C-o>:quitall<CR>

" Ctrl-e = Toggle folding
nnoremap <C-e> za

" Suspend Vim. Same as Ctrl-z normally does but we already
" have that mapped for undo.
nnoremap <silent> <C-A-z> <C-z>

" ------ Search -----.

" Find
nnoremap <C-f> /

" Find next
nnoremap <F3> n

" Find previous. FIXME : Ei toimi.
nnoremap <S-F3> p

" F6 = Clear highlighting after search.
" In Select mode, just go to Insert mode.
nnoremap <F6> :nohlsearch<CR>

" ------- Navigation ---------

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the wrapped portion. This fixes that.

" Scroll one line forward
noremap <script> <Down> <C-E><SID>L

" Scroll one line backward
noremap <script> <Up> <C-Y><SID>L

" To beginning of file
nnoremap <Home> gg0

" To end of file
nnoremap <End> G$

" Ctrl-Up = Go to next line break (paragraph)
nnoremap <C-Up> (
" Ctrl-Down = Go to previous line break (paragraph)
nnoremap <C-Down> )

" Ctrl-g = Goto line. Enter linenumber. In practice same as above.
nnoremap <C-g> :

" ----- Function keys ---------

" F5 = Reload file
nnoremap <F5> :edit!<CR>
nnoremap r :edit!<CR>

" F9 = Open terminal.
" Needs Neovim. Regular Vim doesn't have this functionality.
if has('nvim')
  nnoremap <F9> :terminal<CR>
endif

" F10 Quit. Similar to TUI apps such as htop and Midnight Commander.
nnoremap <F10> :quitall<CR>

" F11 = Toggle line numbers
nnoremap <F11> :set invnumber<CR>

" Ctrl-Alt-P = preferences: opens vimrc.
nnoremap <silent> <C-A-p> :e ~/.vimrc<CR>

" F12 = Source Vim settings
nnoremap <F12> :source $DOTFILES/vim/vimrc<CR>

"------- Tabs --------

" Ctrl-t = New tab
nnoremap <silent> <C-t> :tabnew<CR>

" Ctrl-w = Close tab
nnoremap <silent> <C-w> :tabclose<CR>

" Alt-Right = Next tab
nnoremap <silent> <A-Right> :tabn<CR>

" Alt-Left = Previous tab
nnoremap <silent> <A-Left> :tabp<CR>

"------ Splits ------

" Alt-o = H(o)rizontal split
nnoremap <silent> <A-o> :split<CR>

" Alt-v = V(e)rtical split
nnoremap <silent> <A-e> :vsplit<CR>

" Alt - [suunta] vaihtaa ikkunaa. Missä suunta on i:up, j:left, k:down,l:right
" Alt - <direction> changes window. I=up, J=left, L=down, L=right
nnoremap <A-i> <C-w>k
nnoremap <A-k> <C-w>j
nnoremap <A-j> <C-w>h
nnoremap <A-l> <C-w>l
