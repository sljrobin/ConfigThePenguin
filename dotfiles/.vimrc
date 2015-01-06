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
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
set encoding=utf8  " Encoding UTF-8
set history=700    " History memory
set mouse=a        " Allow use of mouse
set nolist         " Desactivate the list option


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
"" 'Ctrl' + 'd': delete the current line
imap <C-D> <esc>ddi
nmap <C-D> dd

map j gj      " 'j' = 'gj': treat long lines as break lines (down)
map k gk      " 'k' = 'gk': treat long lines as break lines (up)


nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>


"" 'Tab': indent
nnoremap <Tab> >>
vnoremap <Tab> >gv

"" 'Shift' + 'Tab': unindent
inoremap <S-Tab> <C-D>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
syntax on               " Enable colors
set t_Co=256            " Enable 256 colors
colorscheme badwolf     " Main theme
set cursorline          " Highlight the current line
set number              " Enable line numbers
set numberwidth=4       " Line numbers column width
set showmatch           " Highlight matching brackets
set hlsearch incsearch  " Highlight research results


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs/Indentation
set expandtab                   " Insert spaces instead of tabs
set tabstop=4                   " Number of spaces for a tabulation
set shiftwidth=4                " Number of spaces for a reindent operations
set autoindent                  " Turn on auto indentation
set wrap                        " Enable wrapping
set linebreak                   " Allow linebreaks
set backspace=indent,eol,start  " Backspacing autoindent, line breaks, start of insert


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
set laststatus=2             " Print the last status

"" Left panel
set statusline+=%y           " Filetype
set statusline+=\[%.20F\]    " Path

"" Right panel
set statusline+=%=           " Left/Right separator
set statusline+=\[%c\]       " Column
set statusline+=\[%l:%L\]    " Current line:Total lines
set statusline+=\[%P\]       " Percentage

"" Command bar
set showcmd                  " Show command in bottom bar
set cmdheight=2              " Command bar height
set wildmenu                 " Enhance command line completion
set wildignore=*.o,*~,*.pyc  " Ignore compiled files


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Headers
"" Python (.py)
autocmd bufnewfile *.py so $HOME/.vim/headers/py
autocmd bufnewfile *.py exe "1," . 9 . "g/Title          :.*/s//Title          :" .expand("%")
autocmd bufnewfile *.py exe "1," . 9 . "g/Created        :.*/s//Created        :" .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.py execute "normal ma" 
autocmd Bufwritepre,filewritepre *.py exe "1," . 9 . "g/Modified       :.*/s/Modified       :.*/Modified       :" .strftime("%Y-%m-%d %H:%M:%S") 
autocmd bufwritepost,filewritepost *.py execute "normal `a" 
