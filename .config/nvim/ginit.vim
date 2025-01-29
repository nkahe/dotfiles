" NeoVim-Qt sources this and other NeoVim GUIs should too.

if exists('g:GuiLoaded')

  " NeoVim-Qt
  " Set Editor Font
  if exists(':GuiFont')
    " GuiFont! NotoMono\ Nerd\ Font\ Mono:h11
    GuiFont! Noto\ Mono\ for\ Powerline:h11
  endif

  "set guifont=Noto\ Mono\ Nerd\ Font\ Complete\ Mono:h11
  " set guifont=NotoMono\ Nerd\ Font\ Mono:h11

  "call rpcnotify(1, 'Gui', 'Font', 'Noto Mono Nerd Font Complete Mono 11')
  "call rpcnotify(1, 'Gui', 'Font', 'NotoMono Nerd Font Mono 11')

  set guioptions=mr
  GuiPopupmenu 1
  GuiTreeviewShow

  " Disable GUI Tabline
  if exists(':GuiTabline')
      GuiTabline 0
  endif

  " Enable GUI ScrollBar
  if exists(':GuiScrollBar')
      GuiScrollBar 1
  endif

	nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
	inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
	vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

  let g:ale_set_balloons = 1

endif
