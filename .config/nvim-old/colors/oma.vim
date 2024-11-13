" Vim color scheme
" Name:         vividchalk-oma.vim
" Author:       Hendrix <hendrix_ks81@google.com
" Version:      0.5
"
" Based on vividchalk by:
" Name:         vividchalk.vim
" Author:       Tim Pope <vimNOSPAM@tpope.info>
" Version:      2.0
" GetLatestVimScripts: 1891 1 :AutoInstall: vividchalk.vim

" Based on the Vibrank Ink theme for TextMate
" Distributable under the same terms as Vim itself (see :help license)

" NOTE: tabi-rivin ja alapalkin värit määritellään lightlinen teeman
" asetuksissa: ~/.vim/bundle/lightline.vim/autoload/lightline/colorscheme

if has("gui_running")
    set background=dark
endif
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "oma"

" First two functions adapted from inkpot.vim

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
    return strpart("0245", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! E2T(a)
    return s:X(a:a)
endfunction

function! s:choose(mediocre,good)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,first,second,...)
    if a:0 && &t_Co == 256
        let ctermfg = a:1
    else
        let ctermfg = s:choose(a:first,a:second)
    endif
    exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,first,second)
    let ctermbg = s:choose(a:first,a:second)
    exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

highlight link diffAdded        String
highlight link diffRemoved      Statement
highlight link diffLine         PreProc
highlight link diffSubname      Comment

call s:hifg("Normal","#EEEEEE","White",87)
if &background == "light" || has("gui_running")
    hi Normal guibg=Black ctermbg=Black
else
    hi Normal guibg=Black ctermbg=NONE
endif
highlight StatusLine    guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White  cterm=bold
highlight StatusLineNC  guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey   cterm=none
"if &t_Co == 256
    "highlight StatusLine ctermbg=117
"else
    "highlight StatusLine ctermbg=43
"endif

highlight Ignore        ctermfg=Black
highlight WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
highlight Cursor        guifg=Black guibg=White ctermfg=Black ctermbg=White
highlight CursorLine    guibg=#333333 guifg=NONE
highlight CursorColumn  guibg=#333333 guifg=NONE
highlight NonText       guifg=#404040 ctermfg=8
highlight SpecialKey    guifg=#404040 ctermfg=8
highlight Directory     none
high link Directory     Identifier
highlight ErrorMsg      guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE

highlight Search        guifg=#00D9D9 ctermfg=14
call s:hibg("Search"    ,"#005F5F",23,23)
" FIXME: Ylläoleva jostain syystä ottaa sinisen taustaväriksi.
hi Search ctermfg=14 ctermbg=23

highlight IncSearch     guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight MoreMsg       guifg=#00AA00 ctermfg=Green

" LineNr = LineNumbers
highlight LineNr        guifg=#005151 ctermfg=23
highlight Question      none
high link Question      MoreMsg
highlight Title         guifg=Magenta ctermfg=Magenta
highlight VisualNOS     gui=none cterm=none
call s:hibg("Visual"    ,"#555577","LightBlue",83)
call s:hibg("VisualNOS" ,"#444444","DarkBlue",81)
call s:hibg("MatchParen","#1100AA","DarkBlue",18)
highlight WarningMsg    guifg=Red ctermfg=Red
highlight Error         ctermbg=DarkRed
highlight SpellBad      ctermbg=DarkRed
" FIXME: Comments
highlight SpellRare     ctermbg=DarkMagenta
highlight SpellCap      ctermbg=DarkBlue
highlight SpellLocal    ctermbg=DarkCyan

call s:hibg("Folded"    ,"#000000","Black","none")
call s:hifg("Folded"    ,"#aaddee","LightCyan",14)
hi Folded ctermfg=14 ctermbg=none

highlight FoldColumn    ctermfg=30 ctermbg=none
highlight FoldColumn    guifg=#007373
high link FoldColumn    Folded

highlight DiffAdd       ctermbg=22 guibg=DarkGreen
highlight DiffChange    ctermbg=19 guibg=DarkBlue
highlight DiffDelete    ctermfg=7 ctermbg=52 gui=bold guifg=Blue guibg=DarkRed
highlight DiffText      cterm=bold ctermbg=21 gui=bold guibg=Blue

highlight Pmenu         guifg=White ctermfg=White gui=bold cterm=bold
highlight PmenuSel      guifg=White ctermfg=White gui=bold cterm=bold
call s:hibg("Pmenu"     ,"#000099","Blue",18)
call s:hibg("PmenuSel"  ,"#5555ff","DarkCyan",39)
highlight PmenuSbar     guibg=Grey ctermbg=Grey
highlight PmenuThumb    guibg=White ctermbg=White
highlight TabLine       gui=underline cterm=underline
call s:hifg("TabLine"   ,"#bbbbbb","LightGrey",85)
call s:hibg("TabLine"   ,"#333333","DarkGrey",80)
highlight TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight TabLineFill   gui=underline cterm=underline
call s:hifg("TabLineFill","#bbbbbb","LightGrey",85)
call s:hibg("TabLineFill","#808080","Grey",83)

hi Type gui=none
hi Statement gui=none
hi Identifier cterm=none
call s:hifg("Comment"     ,"#00AFAF","DarkCyan",37,37)    " 34
call s:hifg("Constant"    ,"#00AFFF","LightBlue",39)
call s:hifg("String"      ,"#00D787","LightGreen",42,42)
call s:hifg("Identifier"  ,"#5FAF87","Yellow",72)         " 220
" # call s:hifg("Statement"   ,"#D7AF00","LightOrange",178)
call s:hifg("PreProc"     ,"#AAFFFF","LightCyan",47)      " 213
call s:hifg("Type"        ,"#AAAA77","Grey",57)           " 101
call s:hifg("Special"     ,"#33AA00","DarkGreen",24)      " 7
call s:hifg("Regexp"      ,"#44B4CC","DarkCyan",21)       " 74
" Added
call s:hifg("Normal"     ,"#66ffff",14,14)                " 213
" older:
" hi Normal ctermfg=14 ctermbg=none

" hi ALEStyleWarningSign ctermbg=184

" Make folding markers dark gray. http://vim.wikia.com/wiki/Hide_fold_markers
au BufRead,BufNewfile,BufWrite * syn match fmrkr '"*{{{\|"*}}}' |
  \ syn cluster vimCommentGroup contains=fmrkr |
  \ hi fmrkr term=NONE guifg=gray
  \ ctermfg=239

" Omat alkuperäiset muutokset, jotka sisällytetty
" ylläoleviin asetuksiin.
"
" Folding rivi
hi Folded ctermfg=14 ctermbg=none
hi Comment ctermfg=37
" hi String ctermfg=42
hi Constant ctermfg=39
hi Statement ctermfg=178 
hi LineNr ctermfg=23
hi Search ctermfg=14 ctermbg=23
" This is used for vertical column on the left.
hi foldcolumn ctermfg=30 ctermbg=none guibg=NONE

hi VertSplit ctermfg=30 ctermbg=none guibg=NONE

" Left column where error/warning etc signs are listed.
hi SignColumn ctermbg=234
