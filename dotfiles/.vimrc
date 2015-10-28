""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                                                      "
"                                            A Personal Linux Configuration                                            " 
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author
" -> Simon L. J. Robin
" -> http://sljrobin.com
" -> sljrobin@gmail.com
"
" About ConfigThePenguin
" -> http://work.sljrobin.com/configthepenguin
" -> https://github.com/sljrobin/ConfigThePenguin
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections
" -> Initialization
" -> General
" -> Features
" -> Mapping
" -> Appearance
" -> Indentation
" -> Statusline
" -> Headers
" -> FileTypes
" -> Plugins
"
" Notes
" -> General
"    -> Directories in .vim/
"       1. autoload/
"       2. bundle/
"       3. colors/
"
" -> Headers
"    1. Defines the template file
"    2. Write the current filename
"    3. Write the creation date
"    4. Mark the current cursor position before updating
"    5. Updated the last modified date
"    6. Restore the cursor position back to its previous position


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Encoding
scriptencoding utf8                 " Character Encoding used in the script
set encoding=utf-8                  " Main Character Encoding
setglobal fileencoding=utf-8        " Sets UTF-8 as the default value for a particular file (local to buffer)

"" Resetting
set nocompatible                    " Do not let Vim starts its initializations

"" Pathogen
filetype off                        " Unable file type detection
call pathogen#infect()              " Enable Pathogen (1/2)
call pathogen#helptags()            " Enable Pathogen (2/2)
filetype plugin on                  " Enable the plugin files for specific file types
filetype indent on                  " Enable the indent file for specific file types


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" `,`: `mapleader`
let mapleader=','

"" Edit/Load `.vimrc`
" `mapleader` + `ev`: edit the `.vimrc` file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" `mapleader` + `sv`: reload the `.vimrc` file
nmap <silent> <leader>sv :so $MYVIMRC<CR>


""" Indentation
" `Tab`: indent
nnoremap <Tab> >>
vnoremap <Tab> >gv
" `Shift` + `Tab`: unindent
"inoremap <S-Tab> <C-D>
imap <S-Tab> <C-d>
imap <C-S-Tab> <C-d>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv

""" Edition
" `mapleader` + `md`: convert Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

"" `F2`: enable/unable paste mode
"set pastetoggle=<F2>

"" `Ctrl` + `d`: delete the current line
"imap <C-d> <esc>ddi
"nmap <C-d> dd

"" `Ctrl` + `l`: clears the highlight from the last search
nnoremap <C-l> :nohlsearch<CR><C-l>
noremap! <C-l> <ESC>:nohlsearch<CR><C-l>i

"" `F9`: open/close NERD Tree
map <silent> <F9> :NERDTreeToggle<CR>
map! <silent> <F9> <ESC>:NERDTreeToggle<CR>

"" `F10: open/close Tagbar`
nmap <F10> :Tlist<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Features
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Start
set shortmess+=I                    " Hide the launch screen

"" Colors
set t_Co=256                        " Enable 256 colors
syntax on                           " Enable syntax highlighting

"" Theme
let base16colorspace=256            " Access colors present in 256 colorspace
colorscheme base16-default          " Main colorscheme
set background=dark                 " Color the background 
set cursorline                      " Highlight the current line
set number                          " Enable line numbers
set numberwidth=4                   " Line numbers column width
set showmatch                       " Highlight matching brackets
set foldcolumn=1                    " Fold Column width
set foldmethod=indent               " Indentation used for the kind of folding

"" Search
set hlsearch                        " Highlight research results
set ignorecase                      " Ignore case when searching
set incsearch                       " Start searching during typing
set smartcase                       " If pattern contains an uppercase letter, enable case sensitive

"" Terminal
set lazyredraw                      " Better performance when executing macros
set noerrorbells                    " No error sounds
set nolist                          " Do not show invisible characters by default
set scrolloff=20                    " Number of lines above and below the cursor
set title                           " Change the terminal's title
set ttyfast                         " Fast terminal
set visualbell                      " No error sounds


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                       " Insert spaces instead of tabs
set tabstop=4                       " Number of spaces for a tabulation
set shiftwidth=4                    " Number of spaces for a reindent operation
set autoindent                      " Turn on auto indentation
set wrap                            " Enable wrapping
set linebreak                       " Allow linebreaks
set backspace=indent,eol,start      " Enable correct backspacing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                    " Print the last status

"" Command bar
set showcmd                         " Show command in bottom bar
set cmdheight=1                     " Command bar height

"" Wild menu
if has("wildmenu")                  " Check for compatibility
    set wildignore+=*.a,*.hi,*.o         " Ignore `*.a`, `*.hi`, `*.o` files
    set wildignore+=*~,*.bak,*.swp,*.tmp " Ignore `*~`, `*.bak`, `*.swp`, `*.tmp` files
    set wildignore+=*.class,*.pyc        " Ignore `*.class`, `*.pyc` files
    set wildignore+=.DS_Store            " Ignore `.DS_Store` files
    set wildignore+=.git,.hg,.svn        " Ignore `.git`, `.hg`, `.svn` files
    set wildignore+=*.bmp,*.gif,*.ico    " Ignore `*.bmp`, `*.gif`, `*.ico` files
    set wildignore+=*.jpg,*.jpeg,*.png   " Ignore `*.jpg`, `*.jpeg`, `*.png` files
    set wildmenu                         " Enhance command line completion
    set wildmode=longest:full,full       " Complete the longest possible part, then switch
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Headers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Bash (`*.sh`)
autocmd BufNewFile *.sh so $HOME/.vim/headers/sh
autocmd BufNewFile *.sh exe "1," . 9 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.sh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma" 
autocmd Bufwritepre,filewritepre *.sh exe "1," . 9 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.sh execute "normal `a" 

"" C
" (`*.c`)
autocmd BufNewFile *.c so $HOME/.vim/headers/c
autocmd BufNewFile *.c exe "1," . 12 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.c exe "1," . 12 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.c execute "normal ma" 
autocmd Bufwritepre,filewritepre *.c exe "1," . 12 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.c execute "normal `a" 
" (`*.h`)
autocmd BufNewFile *.h so $HOME/.vim/headers/c
autocmd BufNewFile *.h exe "1," . 12 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.h exe "1," . 12 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.h execute "normal ma" 
autocmd Bufwritepre,filewritepre *.h exe "1," . 12 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.h execute "normal `a" 

"" Python (`*.py`)
autocmd BufNewFile *.py so $HOME/.vim/headers/py
autocmd BufNewFile *.py exe "1," . 10 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.py exe "1," . 10 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.py execute "normal ma" 
autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.py execute "normal `a" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Extensions
" Markdown
autocmd BufNewFile,BufReadPost *.md          set filetype=markdown  " Set `*.md` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkd         set filetype=markdown  " Set `*.mkd` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkdn        set filetype=markdown  " Set `*.mkdn` as a Markdown file
autocmd BufNewFile,BufReadPost *.mdown       set filetype=markdown  " Set `*.mdown` as a Markdown file
" Bash
autocmd BufNewFile,BufReadPost .bash_history set filetype=sh        " Set `.bash_history` as a Shell file
autocmd BufNewFile,BufReadPost .bash_logout  set filetype=sh        " Set `.bash_logout` as a Shell file
autocmd BufNewFile,BufReadPost .bashrc       set filetype=sh        " Set `.bashrc` as a Shell file

"" Indentation
autocmd FileType sh setlocal shiftwidth=2 tabstop=2                 " Define indentation for `*.sh` files: 2,2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" indentLine
let g:indentLine_char = '|'             " indentLine: character to use for delimitation
let g:indentLine_color_term = 236       " indentLine: color of the character


"" Tag List
let g:Tlist_Use_Right_Window = 1        " Tag List: show the window at right
