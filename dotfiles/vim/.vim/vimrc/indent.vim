" ConfigThePenguin
" By Simon L. J. Robin | https://sljrobin.org
"
" 'indent.vim': options for visual/real indentation
" This file is a part for '~/.vimrc'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Insert spaces instead of tabs
set tabstop=4                   " Number of spaces for a tabulation
set shiftwidth=4                " Number of spaces for a reindent operation
set autoindent                  " Turn on auto indentation
set wrap                        " Enable wrapping
set linebreak                   " Allow linebreaks
set backspace=indent,eol,start  " Enable correct backspacing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c        setlocal shiftwidth=4 tabstop=4  " Define indentation for `*.c`        files: 4,4
autocmd FileType cpp      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.cpp`      files: 2,2
autocmd FileType css      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.css`      files: 2,2
autocmd FileType cls      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.cls`      files: 2,2
autocmd FileType haskell  setlocal shiftwidth=4 tabstop=4  " Define indentation for `*.hs`       files: 4,4
autocmd FileType html     setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.html`     files: 2,2
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4  " Define indentation for `*.md`       files: 4,4
autocmd FileType plaintex setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.plaintex` files: 2,2
autocmd FileType ruby     setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.rb`       files: 2,2
autocmd FileType sh       setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.sh`       files: 2,2
autocmd FileType tex      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.tex`      files: 2,2
autocmd FileType vim      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.vim`      files: 2,2
autocmd FileType yaml     setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.yaml`     files: 2,2
autocmd FileType zsh      setlocal shiftwidth=2 tabstop=2  " Define indentation for `*.zsh`      files: 2,2
