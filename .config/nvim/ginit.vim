" NeoVim-Qt sources this and other NeoVim GUIs should too.

" if !exists('g:GuiLoaded')
"   return
" endif

" Set Editor Font
if exists(':GuiFont')
  " GuiFont! NotoMono\ Nerd\ Font\ Mono:h11
  " GuiFont! Noto\ Mono\ for\ Powerline:h11
  " GuiFont! FiraCode\ Nerd\ Font:h13
endif

"set guifont=Noto\ Mono\ Nerd\ Font\ Complete\ Mono:h11
" set guifont=NotoMono\ Nerd\ Font\ Mono:h11

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
