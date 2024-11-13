" Lightline {{{1

" Show these plugins in Mode if they are active.
" Ei näyttänyt insert/normal enää.
function! LightLineMode()
  " Show plugin name if mode.
  return expand('%:t') =~? 'FZF' ? 'FZF' : lightline#mode()
endfunction

function! LightLineFilename()
  " Omit Plugin name from filename.
  return expand('%:t') =~? 'FZF' ? '-' : 'relativepath'
" expand('%')
  " fnamemodify(expand("%"), ":~:.")
  " return expand('%:t') =~? 'FZF' ? '' : expand('%:t')
endfunction

" Tuon linen voisi laittaa: '☰'

" hakasulkeet näyttävät, että osat kuuluvat samaan elementtiin.
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'absolutepath', 'modified' ],
  \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
  \   'right': [ [  'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': ''},
  \ 'component_function': {
  \ 'filename': 'LightLineFilename',
  \ 'mode': 'LightLineMode',
  \ },
  \ }

" lightline-ale: Register the components
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" lightline-ale: Set color to the components:
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

if $TERM ==? 'linux'   " On TTY.
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '|', 'right': '|' }
  let g:lightline.colorscheme = '16color'
endif

if $TERM !=? 'linux'
  let g:lightline#ale#indicator_errors = '💡 '
  let g:lightline#ale#indicator_warnings = '→ '
  let g:lightline#ale#indicator_ok = '✅ '
  let g:lightline#ale#indicator_checking = ''
endif

"-- Airline --

" let g:airline#extensions#tabline#enabled = 1

" enable/disable automatic population of the `g:airline_symbols` dictionary
" with powerline symbols.
"let g:airline_powerline_fonts = 1

" enable/disable detection of whitespace errors.
"let g:airline#extensions#whitespace#enabled = 0

" Toggles whitespace detection
"AirlineToggleWhitespace


" comfortable-motion
" sivu
" inoremap <silent> <PageDown> <C-o>:call comfortable_motion#flick(200)<CR>
" inoremap <silent> <PageUp> <C-o>:call comfortable_motion#flick(-200)<CR>
" snoremap <silent> <PageDown> <C-o>:call comfortable_motion#flick(200)<CR>
" snoremap <silent> <PageUp> <C-o>:call comfortable_motion#flick(-200)<CR>
"e let g:comfortable_motion_no_default_key_mappings = 1


" -- ALE -- "

" cnoreabbrev fix ALEFix
" nnoremap <Leader>d :ALEDocumentation<CR>
" nnoremap <Leader>fr :ALEFindReference<CR>
" nnoremap <Leader>gd :ALEGoToDefinition<CR>
" nnoremap <Leader>h :ALEHover<CR>

" --- Autopairs ---
" let g:AutoPairsWildClosedPair = '

" Off by default.
" let b:autopairs_enabled = 0

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
" let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
" let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
" let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1] This will make the list of non-closing tags case-sensitive
" (e.g. `<Link>` will be closed while `<link>` won't.)
" let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
" let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
" let g:closetag_close_shortcut = '<leader>>'


" CtrlP

" let g:ctrlp_map = '<C-p>'

  " MRU = Most Renent Used files
  " call MapAll('<A-m>',':CtrlPMRU<CR>')
  " call MapAll('<A-b>',':CtrlPBuffer<CR>')

  " Make work in some other modes.
  " inoremap <silent> <C-p> <Esc>:set noinsertmode \| :CtrlP<CR>
  " snoremap <silent> <C-p> <Esc>:set noinsertmode \| :CtrlP<CR>

" Deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" CtrlP {{{1

  " ! Ignored patterns are at local_rc.vim !

  " search in Files, Buffers and MRU files at the same time by default.
  " let g:ctrlp_cmd = 'CtrlPMixed'

  " Use caching
  " let g:ctrlp_use_caching = 1

  " The first option tells ctrlp to persist the cache in the configured
  " location, so when you launch vim again, it will read from there and load
  " the cache (much faster).
  " let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

  " Enter avaa uudessa tabissa, C-t nykyisessä.
  "let g:ctrlp_prompt_mappings = {
  "\ 'AcceptSelection("e")': ['<c-t>'],
  "\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  "\ }

  " Etsi tiedostonimien, eikä koko polun perusteella.
  " let g:ctrlp_by_filename = 1

  " Follow symlinks
  " let g:ctrlp_follow_symlinks = 1

  " Show hidden files
  " let g:ctrlp_show_hidden = 1

  " Järjestä tiedostot ylhäältä alas.
  " let g:ctrlp_match_window = 'bottom,order:btt'

  " By default open in new buffer
  " let g:ctrlp_switch_buffer = 0

  " "Unless a starting directory is specified, set dir according edited file.
  " let g:ctrlp_working_path_mode = 'c'

  " let g:ctrlp_switch_buffer = 'Et'
" When opening file, enter jumps to that file if it's already open somewhere.
" Ctrl-t only if it's in current tab.

" Huom! CtrlPMixed + hakemisto ei toimi.

" -- EasyMotion --

" Ei voinut korvata normal searachia, koslasd ei etsi foldingeista.
" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
"let g:EasyMotion_smartcase = 1
"let g:EasyMotion_do_mapping = 1

" Etsi / Hunt. TODO:make these work.
"inoremap <C-h> <C-o><Plug>(easymotion-sn)
" omap h <Plug>(easymotion-tn)
" imap <C-f> <esc><Plug>(easymotion-sn)<insert>

" Käytä Default mappingeja
" let g:EasyMotion_do_mapping = 1
"let g:EasyMotion_do_special_mapping = 1

" Vaihdetaan ylös/alas omien bindausten mulasdisiksi.
" Huom. Vim:n rajoitusten takia Tab ja C-i on sama asia.
" Jos bindaa toisen, niin se vaikuttaa toiseen.
" imap <Leader>k <esc><Plug>(easymotion-j)
"imap <Leader>i <Plug>(easymotion-k)

" ei toimi jostain syystä
"imap <Leader>l <esc><Plug>(easymotion-lineforward)
"imap <Leader>j <esc><Plug>(easymotion-linebackward)
" These `n` & `N` mappings are options. You do not have map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" Nämä oli eri tiedostossa:

"nmap <C-f> <Plug>(easymotion-sn)
" nmap <Leader>k <Plug>(easymotion-j)
"nmap <Leader>i <Plug>(easymotion-k)
"nmap <leader>l <plug>(easymotion-lineforward)
"nmap <leader>j <plug>(easymotion-linebackward)

" Etsi 2 kirjainta
" nmap <Plug>(easymotion-s2)

" Sama, mutta vain kursorin jälkeinen teksti.
" nmap <Plug>(easymotion-t2)

" -- Comfortable motion -plugin --
" 
" puoli sivua
" nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" nnoremap <silent> <PageDown> :call comfortable_motion#flick(200)<CR>
" nnoremap <silent> <PageUp> :call comfortable_motion#flick(-200)<CR>

"Center the window automatically around the cursor after jumping to a location with motions like n (next search pattern occurrence) or } (end of next paragraph):
"nnoremap n nzz
"nnoremap } }zz

" -- Auto-Save --
" Uncomment to enable
" let g:auto_save = 0  " enable AutoSave on Vim startup
" do not change the 'updatetime' option. Oletus on 4000ms.
" But sometimes changing the updatetime option may affect other plugins and break things.
" let g:auto_save_no_updatetime = 1

" --- Syntastic ----

" call MapAll('<F7>',':SyntasticCheck<CR>')

" This sets Syntastic to active mode (checks are made on save or open) but not for, these file types,
" which will be checked only when explicitly running :SyntasticCheck.
" po on ainakin CherryTreen kieliasetustiedosto.
" passive = älä tarkasta, kun tallennetaan.
" let g:syntastic_mode_map = {
"   \ 'mode': 'passive',
"   \ 'passive_filetypes': ['po'] }

" For some reason, Syntastic wants to check this file.
" let g:syntastic_ignore_files = ['zsh']

" Laita errorit locate-listaan
" let g:syntastic_always_populate_loc_list = 1

" Avaa locate-lista virheen löytymisen jälkeen
" let g:syntastic_auto_loc_list = 1

" Tarkista kun avaa tiedoston.
" let g:syntastic_check_on_open = 0

" Aja kun tallentaa/lopettaa.
" let g:syntastic_check_on_wq = 0


" let g:syntastic_loc_list_height=5
" let g:syntastic_enable_highlighting = 1

" let g:syntastic_error_symbol = '✖'
" let g:syntastic_style_error_symbol = '✖'
" let g:syntastic_warning_symbol = '!'
" let g:syntastic_style_warning_symbol = '!'

"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'relativepath', 'modified' ] ],
"      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
"      \ },
"      \ 'component_expand': {
"      \   'syntastic': 'SyntasticStatuslineFlag',
"      \ },
"      \ 'component_type': {
"      \   'syntastic': 'error',
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' }
"      \ }

" YCM "

" Asennusfunktio "
" function! BuildYCM(info)
"   if a:info.status ==? 'installed' || a:info.force
"     !./install.py --ts-completer
"   endif
" endfunction

" Plug 'Valloric/YouCompleteMe', { 'do': unction('BuildYCM') }

" nnoremap <leader>yd :YcmCompleter GetDoc<CR>

" Command mode {{{1

" Familiar emacs-like shortcut from command line shells to Command mode.
cnoremap <C-a> <Home>
 
" Ctrl-Backspace = Delete previous word.
cnoremap <C-BS> <C-\>e<SID>DeleteBackwardsToWhiteSpace()<CR>
cnoremap <C-h> <C-\>e<SID>DeleteBackwardsToWhiteSpace()<CR>

function! <SID>DeleteBackwardsToWhiteSpace()
    call <SID>saveUndoHistory(getcmdline(), getcmdpos())
    let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1)
    let l:roc = strpart(getcmdline(), getcmdpos() - 1)
    if (l:loc =~ '\v\S\s*$')
        let l:rem = matchstr(l:loc, '\v\S+\s*$')
    elseif (l:loc =~ '\v^\s+$')
        let @c = l:loc
        call setcmdpos(1)
        return l:roc
    else
        return getcmdline()
    endif
    let @c = l:rem
    let l:pos = getcmdpos() - strlen(l:rem)
    let l:ret = strpart(l:loc, 0, strlen(l:loc) - strlen(l:rem)) . l:roc
    call <SID>saveUndoHistory(l:ret, l:pos)
    call setcmdpos(l:pos)
return l:ret
endfunction

" C-K = Kill line. (delete from character under cursor to end of line)
cnoremap <C-K> <C-\>e<SID>KillLine()<CR>
function! <SID>KillLine()
    call <SID>saveUndoHistory(getcmdline(), getcmdpos())
    let l:cmd = getcmdline()
    let l:rem = strpart(l:cmd, getcmdpos() - 1)
    if ('' != l:rem)
        let @c = l:rem
    endif
    let l:ret = strpart(l:cmd, 0, getcmdpos() - 1)
    call <SID>saveUndoHistory(l:ret, getcmdpos())
    return l:ret
endfunction

cnoremap <C-U> <C-\>e<SID>BackwardKillLine()<CR>
function! <SID>BackwardKillLine()
    call <SID>saveUndoHistory(getcmdline(), getcmdpos())
    let l:cmd = getcmdline()
    let l:rem = strpart(l:cmd, 0, getcmdpos() - 1)
    if ('' != l:rem)
        let @c = l:rem
    endif
    let l:ret = strpart(l:cmd, getcmdpos() - 1)
    call <SID>saveUndoHistory(l:ret, 1)
    call setcmdpos(1)
    return l:ret
endfunction

let s:oldcmdline = [ ]
function! <SID>saveUndoHistory(cmdline, cmdpos)
    if len(s:oldcmdline) == 0 || a:cmdline != s:oldcmdline[0][0]
        call insert(s:oldcmdline, [ a:cmdline, a:cmdpos ], 0)
    else
        let s:oldcmdline[0][1] = a:cmdpos
    endif
    if len(s:oldcmdline) > 100
        call remove(s:oldcmdline, 100)
    endif
endfunction

" C-Del = Delete next word.
cnoremap <C-del> <C-\>e<SID>KillWord()<CR>
function! <SID>KillWord()
    call <SID>saveUndoHistory(getcmdline(), getcmdpos())
    let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1)
    let l:roc = strpart(getcmdline(), getcmdpos() - 1)
    if (l:roc =~ '\v^\s*\w')
        let l:rem = matchstr(l:roc, '\v^\s*\w+')
    elseif (l:roc =~ '\v^\s*[^[:alnum:]_[:blank:]]')
        let l:rem = matchstr(l:roc, '\v^\s*[^[:alnum:]_[:blank:]]+')
    elseif (l:roc =~ '\v^\s+$')
        let @c = l:roc
        return l:loc
    else
        return getcmdline()
    endif
    let @c = l:rem
    let l:ret = l:loc . strpart(l:roc, strlen(l:rem))
    call <SID>saveUndoHistory(l:ret, getcmdpos())
    return l:ret
endfunction
