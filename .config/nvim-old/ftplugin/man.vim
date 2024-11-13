" Maintainer:          Anmol Sethi <anmol@aubble.com>
" Previous Maintainer: SungHyun Nam <goweol@gmail.com>

" Comes with (Neo)Vim. Some changes.
" This env. variable needs to be set for this to work:
" export MANPAGER="vim/nvim -c 'set filetype=man' -"

if exists('b:did_ftplugin') || &filetype !=# 'man'
  finish
endif
let b:did_ftplugin = 1

let s:pager = !exists('b:man_sect')

if s:pager
  call man#init_pager()
endif

setlocal buftype=nofile
setlocal bufhidden=hide
setlocal nomodified
setlocal readonly
setlocal noexpandtab
setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal foldcolumn=0
setlocal colorcolumn=0
setlocal nolist
setlocal nofoldenable
" Already in configs:
" setlocal nomodifiable
" setlocal nonumber
" setlocal norelativenumber

" Other custom settings to make Vim behave like a pager.
source $DOTFILES/vim/vim-pager.vim

if !exists('g:no_plugin_maps') && !exists('g:no_man_maps')
  nnoremap <silent> <buffer> gO         :call man#show_toc()<CR>
  nnoremap <silent> <buffer> <C-]>      :Man<CR>
  nnoremap <silent> <buffer> K          :Man<CR>
  nnoremap <silent> <buffer> <C-T>      :call man#pop_tag()<CR>
  if s:pager
    nnoremap <silent> <buffer> <nowait> q :lclose<CR>:q<CR>
  else
    nnoremap <silent> <buffer> <nowait> q :lclose<CR><C-W>c
  endif
endif

if get(g:, 'ft_man_folding_enable', 0)
  setlocal foldenable
  setlocal foldmethod=indent
  setlocal foldnestmax=1
endif

let b:undo_ftplugin = ''
" vim: set sw=2:
