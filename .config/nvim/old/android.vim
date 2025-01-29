" Sekalaisia asetuksia {{{1

" Omien näppäinyhdistelmien etumerkki.
let mapleader = ","

set foldmethod=marker
set modelines=1

" Sisennysten (tab) käyttö. 
set smartindent " Intellegently dedent / indent new lines based on rules. Tämä pidä päällä.
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab     " use spaces instead of tabs.
set smarttab      " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround    " tab / shifting moves to closest tabstop.

" Etsintä
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set hlsearch " highlight matches
set incsearch " show search matches as you type
set showmatch " live match highlighting
set gdefault " use the `g` flag by default. Korvatessa korvaa koko riviltä.

" Pitää ruudun siten, että jättää tämän määrän rivejä reunoihin.
set scrolloff=7

" Wrap displays lines by breaking words if necessary. You can force it to preserve words instead by only breaking at certain characters:
set linebreak
   
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Hides buffers instead of closing them. You can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.
set hidden

set autoread    " when a file has changed on disk, just load it. Don't ask.

set wildmenu	" Better command-line completion

" First Tab press (or whatever your wildchar is set to) will expand a filename or command in command mode to the longest common string it can, and a second press will display a list of all possible completions above the command line.
set wildmode=longest,list

" Älä näytä ei-tekstitiedostoja.
set wildignore+=*.html,*.htm,*.odt,*.ods,*.xml,*.xls,*.db,*.jpeg,*.jpg,*.gif,*.pdf,*.doc,*.docx,*.iso,*.gz,*.tgz

" by default Vim places new vertical splits to the left of the current pane, and horizontal splits above the current pane. You can fix both:
set splitbelow
set splitright

" Ei toimi: Lataa asennukset, kun .vimrc sisältö muuttuu.
"augroup myvimrc
"    au!
"    au BufWritePost ".vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC "| if has('gui_running') | so $MYGVIMRC | endif
"augroup END

set virtualedit+=block   " allow the cursor to go anywhere in visual block mode.

" Avatessa tiedosto käytä jo avattua jos sellainen on. Huomioi tabit jos sellaisia on. Avaa uudessa tabissa.
"try
  set switchbuf=useopen,usetab,newtab
"et stal=2
"catch
"endtry

" Ulkonäkö

" Show partial commands in the last line of the screen
set showcmd

" Ei sulkujen korostusta.
let loaded_matchparen = 1

" Help -ikkunasta isompi.
" set helpheight=30

" No annoying sound on errors
" set noerrorbells
" set novisualbell
"s et t_vb=
" set tm=500
 
" Don't redraw while executing macros (good performance config)
" set lazyredraw


" Funktiot {{{1

" Return to last edit position when opening files (You want this!) - Amir Salihefendic
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Sekalaisia bindauksia {{{1


nnoremap <esc>z za
" Ei toimi jostain syystä.
inoremap <esc>z <esc>za<insert>  

" Keep the cursor in place when you join lines with J, you can do this, dropping a mark before the operation to which you return afterwards:
nnoremap J mzJ`z

" ,, = hilight pois
map <silent> <leader><leader> :noh<cr>


" Normal-modeen lisää toimivuutta {{{1

"map the spac key '<space>' in normal mode so that it inserts a space and returns to normal mode
nnoremap <space> <insert><space>

" Backspace
nnoremap <BS> d<left><insert>

" Liikkuminen {{{1

noremap <Down> gj
noremap <Up> gk
" i, j ja k kursorinäppäimiksi  ja h = Insert.
noremap i gk
map j <Left>
noremap k gj
noremap h i
inoremap <esc>h <right><esc>
" gk ja gi:n alkuperäiset bindaukset.
nnoremap gk j
nnoremap gi k

" $ käsky korvataan +:lla.
nnoremap + $
nnoremap d+ d$
nnoremap c+ c$
" A-+ menee rivin loppuun ja lisää välilyönnin menemättä Insert-modeen.
noremap <esc>+ A<space><esc>

" Tiedosto ja välilehdet

" Uusi välilehti
nnoremap <leader>n :tabnew<CR>

" Sulje ikkuna.
nnoremap <leader>w :close<CR>

" A-+ menee rivin loppuun ja lisää välilyönnin menemättä Insert-modeen.
noremap <esc>+ A<space><esc>

" Alt + vasen/oikea vaihtaa tabia.
map <silent> <A-Left> :tabp<CR>
map <silent> <A-Right> :tabn<CR>
nnoremap <silent> <esc>j :tabp<CR>
nnoremap <silent> <esc>l :tabn<CR>
" Sama imodessa.
imap <silent> <A-Left> <esc>:tabp<CR>
imap <silent> <A-Right> <esc>:tabn<CR>
inoremap <silent> <esc>j <esc>:tabp<CR>
inoremap <silent> <esc>l <esc>:tabn<CR>

" Alt + numero vaihtaa tiettyyn tabiin.
noremap <esc>1 1gt
noremap <esc>2 2gt
noremap <esc>3 3gt
noremap <esc>4 4gt
noremap <esc>5 5gt
noremap <esc>6 6gt
noremap <esc>7 7gt
noremap <esc>8 8gt
noremap <esc>9 9gt


