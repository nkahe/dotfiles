" set filetype=vim
" Set graphical terminal emulator tab-titles.

if &term ==? 'screen'
  set t_ts=^[k
  set t_fs=^[\
endif

if &term !=? 'linux' || !has('gui_running')
  " if we are on Vim, editor name has already been set in vimrc.
  if !exists('g:editor_name')
    let g:editor_name='NeoVim'
  endif
  " $TERMINAL is defined in titles.zsh. TODO: terminaalin todennus vimscriptillä?
  if $TERMINAL ==? 'yakuake' || $TERMINAL ==? 'konsole'
    autocmd BufEnter * call Set_qt_title()
  else
    autocmd BufEnter * call Set_title()
  endif
endif

function! Set_title()
  " Terminator, xfce-terminal: asettaa sekä ikkunan että tabin otsikon.
  " For Konsole / Yakuake check next function.
  " FIXME Ei toimi variablet.
  if &filetype ==? 'mail'
    let &titlestring = 'compose mail'
  else
    " Set terminal title
    if @% ==? ''
      let titlestring = g:editor_name
      " let &titlestring = 'Vim'
    else
      let titlestring = g:editor_name . ' ' . expand('%:t')
      " let &titlestring = 'Vim: ' . expand("%:t")
    endif
  endif
  set title
endfunction

function! Set_qt_title()
  " Set terminal tab title by bash script. Yakuakella käytä tätä.
  if @% ==? ''  " If there's no filename.
    " Run external script with 'editor' as parameter.
     execute 'silent !set_tab_title' shellescape(g:editor_name)
  else
    " %:t = Expand tail of the file name (last component of the name)."
    execute 'silent !set_tab_title' shellescape('%:t')
  endif
endfunction
