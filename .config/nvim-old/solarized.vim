" Customization for Solarized theme

" TTY doesn't support enough color.
if $TERM ==? 'linux'
  finish
endif

" These settings override theme color settings.

"highlight Statusline guifg=39 guibg=17

" Finetune colors, make background colors a alot darker etc.
let s:column='#00232c'
" let s:ownbg='#00171E'
" let s:ownbg='#1f1f1f'
" let s:ownbg='#2a2e32'

exe 'highlight ColorColumn guibg='.s:column
" exe 'highlight CursorLine guibg='.s:column
exe 'highlight CursorLineNr guifg=#10839f guibg='.s:column
" exe 'highlight Folded guibg='.s:ownbg
" exe 'highlight FoldColumn guibg='.s:ownbg
exe 'highlight LineNr guibg='.s:column
" exe 'highlight Normal guibg='.s:ownbg

" These are for GUIs, otherwise airline is used.
highlight TabLineSel guibg=#073642
highlight TabLineFill guibg=#002b36

" Replace ugly grey popupmenu.
highlight Pmenu guifg=#839496 guibg=#073642 gui=NONE
" hi! Pmenu ctermfg=0 guifg=#073642 ctermbg=12 guibg=#839496 cterm=NONE,reverse gui=NONE,reverse
highlight PmenuSel guifg=#c4f8fc guibg=#586e75 gui=NONE

if exists('g:GuiLoaded')
  hi! PmenuSel guifg=black
endif

highlight VertSplit guibg=#003543

" ALE-plugin
highlight ALEErrorSign guifg=#7B8C8C ctermfg=12
highlight ALEWarningSign guifg=#7B8C8C ctermfg=12

" Better WhiteSpace -plugin
let g:better_whitespace_guicolor='#8D001B'
