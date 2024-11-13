"Load plugins {{{

" "hover" information when you move the mouse over a symbol in a buffer.
" May affect scrolling in terminal
" let g:ale_set_balloons = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
" let g:ale_completion_enabled = 1

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" ----------------- Plugins ---------------------------------------------------

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Plug 'skywind3000/vim-quickui'

" Plug 'justinmk/vim-dirvish'

Plug 'mhinz/vim-startify'

Plug 'vifm/vifm.vim'

" DidYouMean: Vim plugin which asks for the right file to open
" https://github.com/EinfachToll/DidYouMean
Plug 'EinfachToll/DidYouMean'

" AndrewRadev/splitjoin.vim

" unload, delete or wipe a buffer without closing the window or split
" https://github.com/qpkorr/vim-bufkill:
Plug 'qpkorr/vim-bufkill'

Plug 'vimwiki/vimwiki', { 'for': 'markdown', 'on': ['<Plug>VimwikiIndex', 'VimwikiIndex'] }

" Skip some large plugins on light machines.
if hostname() !=? "raspberrypi"
  " Intellisense engine. https://github.com/neoclide/coc.nvim
  " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'neovim/nvim-lspconfig'
  " Autocompletion plugin
  Plug 'hrsh7th/nvim-cmp'
  " LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  " Snippets source for nvim-cmp
  Plug 'saadparwaiz1/cmp_luasnip'
  " Snippets plugin
  Plug 'L3MON4D3/LuaSnip'
  " 'do': { -> coc#util#install()}}

  " VimL completion source for coc.nvim using neco-vim https://github.com/neocli

" Plug 'mhartington/nvim-typescript'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
endif

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" https://github.com/Townk/vim-autoclose
Plug 'Townk/vim-autoclose'

" Plug 'nathanaelkane/vim-indent-guides'

" A vim plugin to display the indention levels with thin vertical lines.
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" Intelligently reopen files at your last edit position.
Plug 'farmergreg/vim-lastplace'

" Replace text with the contents of a register
" https://github.com/vim-scripts/ReplaceWithRegister
Plug 'vim-scripts/ReplaceWithRegister'

" Vim-cool disables search highlighting when you are done searching and
" re-enables it when you search again. https://github.com/romainl/vim-cool
Plug 'romainl/vim-cool'

" ----------------- Languages -------------------------------------------------

" An up-to-date Vim syntax for PHP. https://github.com/StanAngeloff/php.vim
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

Plug 'othree/html5.vim', { 'for': 'html' }

" Provide filetype-dependent templates for new file.
" https://github.com/ap/vim-templates.
Plug 'ap/vim-templates'

" Auto close (X)HTML tags. https://github.com/alvan/vim-closetag.
Plug 'alvan/vim-closetag', { 'for': ['html', 'php'] }

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Syntax file for JavaScript libraries.
" https://github.com/othree/javascript-libraries-syntax.vim
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

" CSS3 syntax (and syntax defined in some foreign specifications) support for
" Vim's built-in syntax/css.vim. https://github.com/hail2u/vim-css3-syntax
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

"------------------ Appearance ------------------------------------------------

" Plug 'mhartington/oceanic-next'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

Plug 'chrisbra/Colorizer'
" Plug 'chrisbra/Colorizer', { 'on': 'ColorToggle' }

" ---- Colorscheme

" Vaihtoehtoisia
" Plug 'lifepillar/vim-solarized8'
" Plug 'romainl/flattened'
" Neovim/Vim color scheme inspired by Dark+ and Light+ theme in Visual Studio Code
" https://github.com/Mofiqul/vscode.nvim
Plug 'Mofiqul/vscode.nvim'

" neomutt.vim/ftplugin at master · neomutt/neomutt.vim
" https://github.com/neomutt/neomutt.vim/tree/master/ftplugin
Plug 'neomutt/neomutt.vim', { 'for': ['muttrc', 'mail'] }

" NERDTree. https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim-nerdtree-tabs: NERDTree and tabs together in Vim, painlessly.
" https://github.com/jistr/vim-nerdtree-tabs . Not maintained.
" Plug 'jistr/vim-nerdtree-tabs'

" Plug 'NLKNguyen/papercolor-theme'

" --- Pope's plugins ---

" Comment stuff out. gcc, gc in visual / operator pending mode.
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" Helpers for UNIX. https://github.com/tpope/vim-eunuch
Plug 'tpope/vim-eunuch'

" Can repeat plugin commands like vim-surround.
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple. https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

Plug 'tpope/vim-vinegar'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"}}}
" Plugin settings {{{

" setup used libraries:

let g:used_javascript_libs = 'jquery'


" ---------------- Airline ----------------------------------------------------

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:fzf_nvim_statusline = 0

let g:airline_theme='base16_3024'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Set to 1 to enable italics in the terminal (default is 0).
let g:solarized_term_italics = 1

" ALE {{{

" ! Lang specific settings are in ftpplugins

let g:ale_lint_delay = 1000

if $TERM !=? 'linux'
  " Use fancy symbols if we are not in TTY.
  let g:ale_sign_error = '═'
  let g:ale_sign_warning =  '‒'
  " Mild grey colors for signs
endif
let g:ale_sign_column_always = 1

" Airline-Ale

" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic-err, eclim,
"                                languageclient_error_count)
" let g:airline_section_warning (ycm_warning_count, syntastic-warn,
"                                languageclient_warning_count, whitespace)

"enable/disable ale integration >
  let g:airline#extensions#ale#enabled = 1

" ale error_symbol >
  let airline#extensions#ale#error_symbol = '💡 '

" ale warning >
  let airline#extensions#ale#warning_symbol = '→ '

" ale show_line_numbers >
  let airline#extensions#ale#show_line_numbers = 1

" ale open_lnum_symbol >
  let airline#extensions#ale#open_lnum_symbol = '(L'

" ale close_lnum_symbol >
  let airline#extensions#ale#close_lnum_symbol = ')'

" ALE Completion inserts own words without this.
" set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Don't use project specific but global executables for all linters
let g:ale_use_global_executables = 1

" Only run linters named in ale_linters settings.
" "let g:ale_linters_explicit = 1

" failing executable checks will be cached, along with successful ones. This
" behaviouris off by default, because it means you have to restart Vim to run
" linters after you install them.
let g:ale_cache_executable_check_failures = 1

" also setting in line in autocommands

" }}}

" ----------------- NERDTree --------------------------------------------------

" Open NERDTree at GUI startup?
" let g:nerdtree_tabs_open_on_gui_startup=0

"let g:NERDTreeHijackNetrw=0
"
" automatically close NerdTree when you open a file:
" let NERDTreeQuitOnOpen = 1

" Automanically delete the bufer of the file you just deleted with NerdTree:
let NERDnreeAutoDeleteBuffer = 1

" Default path for wiki.
let g:vimwiki_list = [{'path': '$HOME/Shared/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Append wiki file extension to links in Markdown.
let g:vimwiki_markdown_link_ext = 1

" }}}
" Source other files {{{
" ! '~' doesn't work properly if we are root!

" Source only if file exists and is readable.
function! SourceIfExists(file)
  if !empty(glob(a:file))
    exe 'source' a:file
  endif
endfunction

runtime mswin.vim

" Caused error. Why this was added?
" lua require('config')

" Mappings for exotic key combos.
" call SourceIfExists('$VIMCONFIG/opensuse-defaults.vim')
" runtime opensuse-defaults.vim

" call SourceIfExists('$DOTFILES/vim/mappings.vim')
" runtime mappings.vim

" Local computer specific settings.
call SourceIfExists('local.vim')

" }}}
" Misc settings {{{

" NeoVim doesn't source this by default unlike Vim. Useful?
" if has('nvim') | silent! source /etc/vimrc | endif

" Notice: Don't need for 'syntax on' or 'ftp indent on' since VimPlug takes care of that.

set clipboard=unnamedplus  " Use system clipboard. unnamed = 'select' (3rd mouse button)  clipboard.
set confirm                " Confirm when exiting with unsaved changes.
set foldmethod=marker      " Fold with markers by default.
set formatoptions+=t       " For text wrapping.
set linebreak              " Wrap long lines preserving word.
set modeline modelines=3
set nostartofline          " Stop certain movements from always going to the first character of a line.
set noswapfile nobackup    " No swap files or backups
set path+=**               " Commands like 'find' search files recursively.
set scrolloff=7            " leave space before and after cursor when scrolling.
" set shortmess+=filmnrxoOtT " Shorter messages. (no 'hit enter')
set signcolumn=yes         " Always show signcolumns
set splitbelow splitright  " Where open new splits.
set textwidth=100
set updatetime=300         " Coc: Smaller updatetime for CursorHold & CursorHoldI
" Allow the cursor to go anywhere in visual block mode and beyond last character.
set virtualedit+=block,onemore
set whichwrap+=h,l         " h/l wrap to previous/next line.
set wrap wrapmargin=2      " Wrap lines 2 chars from the right window border.

if has('mouse') | set mouse=a | endif    " Use mouse if available.

" Tab and indenting

filetype plugin indent on
set expandtab      " use spaces instead of tabs.
set tabstop=2      " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2   " Indent by n spaces when using >>, <<, == etc
set softtabstop=2  " Indent by n spaces when pressing <TAB>.
set autoindent
set shiftround     " tab / shifting moves to closest tabstop.

" Searching
set ignorecase     " case insensitive search...
set smartcase      " but ff there are uppercase letters, become case-sensitive.
set showmatch      " live match highlighting
set gdefault       " use the `g` flag (replace globally all instances) by default.

" Hides buffers instead of closing them. You can have unwritten changes to a file
" and open a new file using :e, without being forced to write or undo your changes
" first. Also, undo buffers and marks are preserved while the buffer is open.
" Coc-plugin: "if hidden not set, TextEdit might fail."
set hidden

" Key shows longest match, second selectable menu with one tab
set wildmode=longest,full

" Do not show some common non-text files.
set wildignore+=*.odt,*.odp,*.ods,*.xml,*.xls,*.db,*.jpeg,*.jpg,*.gif,*.png,*.pdf,*.PDF
set wildignore+=*.doc,*.docx,*.rtf,*.ppt,*.iso,*.gz,*.tgz,*.mkv,*.flv,*.srt,*.ctb,*.mp3

" Use open buffers/tabs if exists. Open in new tab.
set switchbuf=useopen,usetab,newtab

" No annoying sound on errors
set noerrorbells novisualbell t_vb= timeoutlen=500

" }}}
 " Appearance {{{

" Fancier appearance if we are not in TTY.
if $TERM !=? 'linux'

  " Use truecolors
  if has('termguicolors') | set termguicolors | endif
  " Enable use of italic fonts
  let g:neosolarized_italic = 1
  set background=dark
  " let g:neosolarized_contrast = "high"
  " colorscheme flattened_dark
  " colorscheme solarized8_high
  " Override some color settings.
  " runtime color_override.vim

  " Configuring colorscheme like this doesn't work.
  " lua << EOF
  " local c = require('vscode.colors').get_colors()
  "   require('vscode').setup({
  "   transparent = true,
  "   italic_comments = true,
  "   underline_links = true,
  "   disable_nvimtree_bg = true,
  "   color_overrides = {
  "     vscLineNumber = '#FFFFFF',
  "   },
  "   group_overrides = {
  "     Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
  "   }
  " })
  " vim.cmd.colorscheme("vscode")
  " EOF

  colorscheme vscode

  " Non-visible characters used with 'set list'.
  set listchars=tab:>▸,trail:·,extends:⫸,precedes:⫷,nbsp:␣,eol:¶
  let NERDTreeDirArrows = 1
  let g:indentLine_char = '┊'
else  " On TTY need to use basic settings.
  colorscheme oma
  set listchars=tab:>\ ,trail:~,extends:>,precedes:<,nbsp:+,eol:$
  " Disable different cursors since it doesn't work on TTY.
  set guicursor=
endif

set cmdheight=2       " Better display for messages (Coc)
set colorcolumn=80    " Default value to column to show where line should end.
" set foldcolumn=1    " Column in left showing folds.
set cursorline        " Hilight cursorline.
set helpheight=100    " Make help screen bigger
set lazyredraw        " Don't redraw while executing macros (performance config)
set matchtime=3       " tenths of a second to blink when matching brackets
set noshowmode        " Don't show '--INSERT--' since using Airline.
set number            " Show current line number
set previewheight=5   " Preview window height
set relativenumber    " Show relative line numbers
set shortmess+=Ic     " Turn offf start-up message,
                      " Coc: don't give |ins-completion-menu| messages.
set synmaxcol=250     " Syntax hilight only for 250 first character for performance.

if has('linebreak')
  try
    set breakindent   " Visually indent wrapped lines
    let &showbreak='↳'
  catch /E518:/
    " Unknown option: breakindent
  endtry
endif

" Netrw: Many columns of files for netrw.
let g:netrw_liststyle = 2

" }}}
" Autocommands {{{

" So dublicate autocmd's aren't added when sourcing this file.
augroup vimrc
" Clear previous autocommands
  autocmd!

  " Source configurations when saving.
  autocmd BufWritePost $MYVIMRC,mappings.vim source % | echom "Sourced this file." | redraw

  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
    \b:NERDTree.isTabTree()) | q | endif

  " Open when starting Vim.
  " autocmd vimenter * NERDTree

  au BufRead,BufNewFile *.vim setfiletype vim
  au BufRead,BufNewFile *.css setfiletype css
  au BufRead,BufNewFile *.html setfiletype html
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.js setfiletype javascript

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time). From default.vim
  " autocmd BufReadPost *
  "   \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  "   \ |   exe "normal! g`\""
  "   \ | endif

  " In quickfix window plain <CR> jumps to the error under the cursor.
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

  " Create non-existing directories while writing a file .
  autocmd BufWritePre *
  \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
      \ call mkdir(expand('<afile>:h'), 'p') |
  \ endif

  if has('coc')
    " Setup formatexpr specified filetype(s).
    autocmd FileType css,html,javascript,php,typescript,json,vim setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Comment highlighting for jsonc (json with comments, Coc uses this.)
    autocmd FileType json syntax match Comment +\/\/.\+$+

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
  endif

  " Automatically exit insert mode
  " au InsertEnter * let updaterestore=&updatetime | set updatetime=4000
  " au InsertLeave * let &updatetime=updaterestore
  " au CursorHoldI * stopinsert

  silent! autocmd InsertEnter * :set norelativenumber
  silent! autocmd InsertLeave * :set relativenumber

" automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  if has('nvim')
  " Insert mode by default in terminal.
    autocmd TermOpen term://* startinsert

    " On terminal exit avoid "[Process exited 0]" -message.
    autocmd TermClose * call feedkeys("i")
  end

  " Delete hidden buffers
  " "autocmd BufEnter * setlocal bufhidden=delete

augroup END

" ft=vim
" }}}
