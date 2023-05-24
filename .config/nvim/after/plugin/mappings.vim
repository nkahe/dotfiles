" Functions {{{1

let mapleader = ' '

function! DiscardingPlugUpdate()
  let dirties = filter(copy(g:plugs),
    \ {_, v -> len(system(printf("cd %s && git diff --no-ext-diff --name-only", shellescape(v.dir))))})
  if len(dirties)
    call map(values(dirties),
      \ {_, v -> system(printf("cd %s && git checkout -f", shellescape(v.dir)))})
    PlugUpdate --sync
    execute 'PlugInstall!' join(keys(dirties))
  else
    PlugUpdate
  endif
endfunction
command! DPU call DiscardingPlugUpdate()

" Map to all most common modes.
function! MapAll(key, command)
  exec 'nnoremap' a:key a:command
  exec 'inoremap' a:key '<C-o>' . a:command
  exec 'snoremap' a:key '<esc><C-o>' . a:command
endfunction

" Same but do identical mappings to Insert and Select modes.
function! MapAllIdent(key, command)
  exec 'nnoremap' a:key a:command
  exec 'inoremap' a:key '<C-o>' . a:command
  exec 'snoremap' a:key '<C-o>' . a:command
endfunction

" Misc plugins {{{1

" Autoclose
call MapAll('<A-a>', ':AutoCloseToggle<CR>')

" = Buffkill

" Delete buffer but leave windows/split intact:
nnoremap <Leader>bd :BD<CR>

" wipe a file from the buffer and keep the window/split intact:
nnoremap <Leader>bw :BW<CR>

" = Colorizer
nnoremap <Leader>ch :ColorHighlight<CR>
nnoremap <Leader>cc :ColorClear<CR>
nnoremap <Leader>ct :ColorToggle<CR>

" = FZF
nnoremap  <C-p> :Files<CR>
" M = Most recent used
nnoremap <Leader>m :History<CR>
vnoremap <Leader>b :Buffers<CR>

" = Gnvim
inoremap <expr> <C-A-i> gnvim#completion_menu_toggle_info()

" = NERDTree
" nnoremap <Leader>n :NERDTreeToggle<CR>
" call MapAll('<C-b>',':NERDTreeToggle<CR>')

" = Vim-Wiki

" '+' is used to add single characters in my config.
nmap ++ <Plug>VimwikiNormalizeLink
vmap ++ <Plug>VimwikiNormalizeLinkVisual

" Show links and not just their name etc.
nnoremap <leader>h :call ConcealToggle()<cr>

function! ConcealToggle()
    if &conceallevel == 0
        set conceallevel=2
    else
        set conceallevel=0
    endif
endfunction

nmap <Leader>ww <Plug>VimwikiIndex<Bar>:NERDTree<CR>

" This plugins mappings override many important mappings so let's redife them.

nmap <Leader>wn <Plug>VimwikiNextLink

" map <Leader>tl <Plug>VimwikiToggleListItem

" Split and follow (create target wiki page if needed.
nmap <Leader>wsp <Plug>VimwikiSplitLink

" Vertical split and follow (create target wiki page if needed).
nmap <Leader>wvsp <Plug>VimwikiVSplitLink

" Move current table column to the left / right.
nmap <Leader>wtl <Plug>VimwikiTableMoveColumnLeft
nmap <Leader>wtr <Plug>VimwikiTableMoveColumnRight

nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay

" Coc {{{1

" Use `[c` and `]c` for navigate diagnostics
" TODO: remap
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Gotos
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Documentation

function! s:show_documentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent>K :call <SID>show_documentation()<CR>

" Rename current word
inoremap  <F2> <Plug>(coc-rename)
nnoremap  <F2> <Plug>(coc-rename)

" call MapAll('<F5>',':edit!<CR>')

" Format selected region
vmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

" Do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Use <C-Space> for trigger completion.
inoremap <Silent><Expr> <C-Space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate. Use
" command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <Silent><Expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <Expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
inoremap <Expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" CocList {{{

" Show all diagnostics
nnoremap <silent> <Leader>la  :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent> <Leader>le  :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent> <Leader>lc  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <Leader>lo  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <Leader>ls  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <Leader>lj  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <Leader>lk  :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent> <Leader>lp  :<C-u>CocListResume<CR>

" }}}

" }}}1
" Misc {{{1

" Insert mode
" inoremap jk <esc>

" Increment and decrement a number.
nnoremap + <C-a>
nnoremap - <C-X>

" Insert timestamp dd.mm.yyyy
inoremap <A-m> <C-R>=strftime("%d.%m.%y")<CR>
nnoremap <A-m> "=strftime("%d.%m.%y")<CR>p

" Disable CTRL-A on tmux or on screen
if $TERM =~? 'screen'
  nnoremap <C-a> <nop>
  nnoremap <Leader><C-a> <C-a>
endif

" Black hole register. Use before command for when not wanting copy it to
" clipboard / register.
" noremap - "_

" Backtick character is very awkward to press in nordic keyboard, so let's
" remap it:
noremap å `

" Paste selected text to command line.
" snoremap <C-l> <C-o>y:<C-r>"

" Toggle invisible invisible characters
nnoremap <Leader>i :set list!<CR>

" New shortcuts since these are remapped in mswin.vim
nnoremap <C-A-v> <C-v>
nnoremap <C-A-x> <C-x>
nnoremap <C-A-z> <C-z>

" Use black hole register aka "_ with these.
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
nnoremap S "_S
nnoremap c "_c
nnoremap C "_C

" Toggle spellcheck
nnoremap <Leader>ss :setlocal spell!<cr>

" Make these work also in Normal mode:
nnoremap <BS> i<BS><Esc>l
nnoremap <Return> i<CR><Esc>
" nnoremap <BS> "_d<left><insert>
" nnoremap <Return> i<CR>

" Keep the cursor in place when you join lines with J, you can do this,
" dropping a mark before the operation to which you return afterwards:
nnoremap J mzJ`z

" Add newline while staying Normal mode.
nnoremap <leader>ij o<Esc>
nnoremap <leader>ik O<Esc>

" Insert single character. Can be repeated with . or added count.
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap <silent>ä :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
" nnoremap {cmd} :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Clear highlighting, update diff, redraw screen.
inoremap <C-l> <C-o>:nohlsearch<BAR>diffupdate<CR><C-o><C-l>
nnoremap <C-l> :nohlsearch<BAR>diffupdate<CR><C-l>

"D deletes from the cursor to the end of the line; C changes from the cursor to
"the end of the line. But Y yanks the entire line. Fix to yank to the end of line.
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" Select all text
nnoremap vA ggVG

" Open/close folding
nnoremap <Tab> za<CR>

" Close other folds than current one.
nnoremap ,z zMzvzz

" Buffers {{{1

" Use ,, to switch between buffers
nnoremap <leader><leader> :b#<CR>

" FZF does similar
" nnoremap <leader>b :ls<cr>:b<space>

" done with buffkill-plugin.
" nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>
call MapAll('<A-Left>',':bprev<CR>')
call MapAll('<A-Right>',':bnext<CR>')
call MapAll('<A-h>',':bprev<CR>')
call MapAll('<A-l>',':bnext<CR>')

" Windows {{{1

call MapAll('<A-PageUp>', ':lprev<CR>')
call MapAll('<A-PageDown>', ':lnext<CR>')

nnoremap <Leader>c :close<CR>
call MapAll('<A-c>', ':close<CR>')
call MapAll('<A-j>','<C-w>j')
call MapAll('<A-k>','<C-w>k')

nnoremap <Leader><Right> <C-w>l<CR>
nnoremap <Leader><Left> <C-w>h<CR>
nnoremap <Leader><Up> <C-w>k<CR>
nnoremap <Leader><Down> <C-w>j<CR>
call MapAll('<A-Up>','<C-w>k')
call MapAll('<A-Down>','<C-w>j')

" Tabs {{{1

nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

call MapAll('<A-1>','1gt')
call MapAll('<A-2>','2gt')
call MapAll('<A-3>','3gt')
call MapAll('<A-4>','4gt')
call MapAll('<A-5>','5gt')
call MapAll('<A-6>','6gt')
call MapAll('<A-7>','7gt')
call MapAll('<A-8>','8gt')
call MapAll('<A-9>','9gt')

" Function keys {{{1

" F2 = Coc Rename

call MapAll('<F3>','n')

" In select mode find next instance of selected text
snoremap * <C-o>y/<C-r>"<CR>
smap <F3> *

" Find previous
nnoremap ^[O2R p
nmap O2R p
nmap <esc>O2R p

" Reload file
call MapAll('<F5>',':edit!<CR>')

" Sitch to paste mode, disabling all kinds of smartness and just pasting
" a whole buffer of text.
set pastetoggle=<F6>

" Toggle relative / nonrelative line numbers
call MapAll('<F11>',':set invrelativenumber<CR>')

" File & dir management {{{1

call MapAll('<C-A-p>',':edit $MYVIMRC<CR>')

" Set working dir to dir of current file (and display it).
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>e :Explore<CR>

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>em :edit ~/.config/nvim/after/plugin/mappings.vim<CR>

" Save if needed and open the file in the default application,
" like open html-file in a browser.
nnoremap <silent> <Leader>o :update<Bar>silent !xdg-open %:p &<CR>

" Lists {{{1

nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>lc :lclose<CR>
nnoremap <Leader>cc :cclose<CR>

" Motions & scrolling {{{1

nnoremap <leader>d "_d

" Visual line nav, not real line nav. If you wrap lines, vim by default won't
" let you move down one line to the wrapped portion. when preceded with a
" count then we want to go back to strict linewise movements. Similar to the
" first version except this version will automatically save movements larger
" than 5 lines to the jumplist.
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <expr> <Down> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> <Up> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Scroll without moving cursor.
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>
noremap <C-k> <C-y>
noremap <C-j> <C-e>

" nnoremap <Down> gj
" nnoremap <Up> gk

" For scandinavian keyboards.
noremap ö $

" GUI-like shortcuts {{{1

call MapAll ('<C-BS>', '"_db')
" Also C-BS, if terminal supports this.
call MapAll ('<ESC>[127;5u', '"_db')
call MapAll ('<A-BS>', '"_db')
call MapAll ('<C-Del>', 'dw')
call MapAll ('<C-Home>', 'gg0')
call MapAll ('<C-End>', 'G$')

call MapAll ('<S-Insert>', '<MiddleMouse>')

" nmap is in mswin.vim but this makes it work in different modes.
call MapAll('<C-s>',':update<CR>')

" Abbrevations and commands {{{1

" Use abbrevation<Tab> to expand.

" Timestamp
iabbrev xdate <c-r>=strftime("%d.%m.%y")<cr>

" Make :W -> :w safe way
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

command! -nargs=0 Vterm vsplit term://$SHELL


" New objects {{{1

" Inner line
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

" Inner buffer
xnoremap <silent> ib gg0oG$
onoremap <silent> ib :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" Terminal {{{1

" Exit terminal
tnoremap <Leader><Esc> <C-\><C-N>

" vi: ft=vim
