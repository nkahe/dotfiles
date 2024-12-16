" Some settings for some Vim / Neovim GUI clients

" NeoVim-Qt uses this but has settings also in ~/.config/neovim-qt
" https://github.com/equalsraf/neovim-qt

" Ei voi käyttää funktion sisällä
" if !exists('g:GuiLoaded')
"   return
" endif

if exists(':GuiFont')
  " GuiFont! NotoMono\ Nerd\ Font\ Mono:h11
  " GuiFont! Noto\ Mono\ for\ Powerline:h11
  " set guifont=NotoMono\ Nerd\ Font\ Mono:h11
  " set guifont=Noto\ Mono\ Nerd\ Font\ Complete\ Mono:h11
  " Didn't work:
  " GuiFont! FiraCode\ Nerd\ Font:h13
endif

set guioptions=mr

if exists(':GuiPopupmenu')
    GuiPopupmenu 1
endif

if exists(':GuiTreeviewShow')
  GuiTreeviewShow 0
endif

" Disable GUI Tabline
if exists(':GuiTabline')
  GuiTabline 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
" vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
" snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
