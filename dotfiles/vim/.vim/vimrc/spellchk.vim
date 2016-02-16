" ConfigThePenguin
" By Simon L. J. Robin | https://sljrobin.org
"
" 'spellchk.vim': options for spell-checking
" This file is a part for '~/.vimrc'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Styles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Style `SpellBad` (word not recognized)
highlight clear SpellBad
highlight SpellBad term=reverse
highlight SpellBad cterm=reverse
highlight SpellBad ctermfg=1

" Style `SpellCap` (word not capitalized)
highlight clear SpellCap
highlight SpellCap term=standout
highlight SpellCap cterm=reverse
highlight SpellCap ctermfg=16

" Style `SpellRare` (rare word)
highlight clear SpellRare
highlight SpellRare term=underline
highlight SpellRare cterm=reverse
highlight SpellRare ctermfg=3

" Style `SpellLocal` (wrong spelling for selected region)
highlight clear SpellLocal
highlight SpellLocal term=underline
highlight SpellLocal cterm=reverse
highlight SpellLocal ctermfg=5


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal spell  " Set Spell-Checking for Markdown files