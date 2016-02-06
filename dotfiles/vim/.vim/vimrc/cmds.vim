" ConfigThePenguin
" By Simon L. J. Robin | https://sljrobin.org
"
" 'cmds.vim': personal commands
" This file is a part for '~/.vimrc'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Rpdf>: convert a pdf to a text file inside vim
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
