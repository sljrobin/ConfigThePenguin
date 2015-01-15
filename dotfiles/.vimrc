""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" Author
" -> Simon L. J. Robin
" -> http://sljrobin.com
" -> sljrobin@gmail.com
"
" Sections
" -> Pathogen
" -> General
" -> Mapping
" -> Theme/Colors
" -> Tabs/Indentation
" -> Statusline
" -> Headers
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8  " Encoding UTF-8
set history=700    " History memory
set mouse=a        " Allow use of mouse
set nolist         " Desactivate the list option


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 'Ctrl' + 'd': delete the current line
imap <C-D> <esc>ddi
nmap <C-D> dd


map j gj      " 'j' = 'gj': treat long lines as break lines (down)
map k gk      " 'k' = 'gk': treat long lines as break lines (up)


"" 'Tab': indent
nnoremap <Tab> >>
vnoremap <Tab> >gv

"" 'Shift' + 'Tab': unindent
inoremap <S-Tab> <C-D>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv

"" '\' + 'md': convert Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                           " Enable colors
set t_Co=256                        " Enable 256 colors
colorscheme badwolf                 " Main theme
set cursorline                      " Highlight the current line
set number                          " Enable line numbers
set numberwidth=4                   " Line numbers column width
set showmatch                       " Highlight matching brackets
set hlsearch incsearch              " Highlight research results


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs/Indentation
set expandtab                       " Insert spaces instead of tabs
set tabstop=4                       " Number of spaces for a tabulation
set shiftwidth=4                    " Number of spaces for a reindent operation
set autoindent                      " Turn on auto indentation
set wrap                            " Enable wrapping
set linebreak                       " Allow linebreaks
set backspace=indent,eol,start      " Enable correct backspacing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
set laststatus=2                    " Print the last status

"" vim-airline
let g:airline_powerline_fonts=1     " Enable powerline-fonts
let g:airline_theme='powerlineish'  " Theme 'powerlineish'

"" Command bar
set showcmd                         " Show command in bottom bar
set cmdheight=2                     " Command bar height
set wildmenu                        " Enhance command line completion
set wildignore=*.o,*~,*.pyc         " Ignore compiled files


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Headers
"" Python (.py)
autocmd bufnewfile *.py so $HOME/.vim/headers/py
autocmd bufnewfile *.py exe "1," . 9 . "g/Title          :.*/s//Title          :" .expand("%")
autocmd bufnewfile *.py exe "1," . 9 . "g/Created        :.*/s//Created        :" .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.py execute "normal ma" 
autocmd Bufwritepre,filewritepre *.py exe "1," . 9 . "g/Modified       :.*/s/Modified       :.*/Modified       :" .strftime("%Y-%m-%d %H:%M:%S") 
autocmd bufwritepost,filewritepost *.py execute "normal `a" 
