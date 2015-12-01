""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
" Vundle | Begin
set nocompatible                        " Do not let Vim starts its initializations
filetype off                            " Unable file type detection
set rtp+=~/.vim/bundle/Vundle.vim       " Set the RunTimePath
call vundle#begin()                     " Begin Vundle

" Plugins
Plugin 'VundleVim/Vundle.vim'           " Plugin: Vundle
Plugin 'chriskempson/base16-vim'        " Plugin: Base16
Plugin 'scrooloose/nerdtree'            " Plugin: NERDTree
Plugin 'Raimondi/delimitMate'           " Plugin: delimitMate
Plugin 'terryma/vim-multiple-cursors'   " Plugin: vim-multiple-cursors
Plugin 'Yggdroot/indentLine'            " Plugin: indentLine
Plugin 'Valloric/YouCompleteMe'         " Plugin: YouCompleteMe
Plugin 'majutsushi/tagbar'              " Plugin: Tagbar
Plugin 'SirVer/ultisnips'               " Plugin: UltiSnips
Plugin 'honza/vim-snippets'             " Plugin: vim-snippets

" Vundle | End
call vundle#end()                       " End Vundle
filetype plugin on                      " Enable the plugin files for specific file types
filetype indent on                      " Enable the indent file for specific file types

" Plugins Options
" vim-multiple-cursors
let g:multi_cursor_exit_from_visual_mode=0                " Quit and delete all existing cursors in Visual mode
let g:multi_cursor_exit_from_insert_mode=0                " Quit and delete all existing cursors in Normal mode

" indentLine
let g:indentLine_char = '|'                               " Character to use for delimitation
let g:indentLine_color_term = 236                         " Color of the character

" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']  " '<Ctrl> + <n>' | '<Down>': cycle forwards through the completion list
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']  " '<Ctrl> + <p>' | '<Up': cycle backwards through the completion list
let g:ycm_min_num_of_chars_for_completion=2               " Number of characters needed to be typed before completion suggestions

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"                      " <Tab>: expand a snippet
let g:UltiSnipsJumpForwardTrigger="<C-n>"                 " <Ctrl> + <n>: cycle forwards through the snippets list
let g:UltiSnipsJumpBackwardTrigger="<C-p>"                " <Ctrl> + <p>: cycle backwards through the snippets list
let g:UltiSnipsEditSplit="vertical"                       " Set a vertical window for editing the snippets



"" Encoding
scriptencoding utf8                 " Character Encoding used in the script
set encoding=utf-8                  " Main Character Encoding
setglobal fileencoding=utf-8        " Sets UTF-8 as the default value for a particular file (local to buffer)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd VimResized * :wincmd = " Automatically resize the windows inside vim
""" mapleader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <,>
" mapleader
let mapleader=','


""" mapleader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Edit/Load `.vimrc`
" `mapleader` + `ev`: edit the `.vimrc` file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" `mapleader` + `sv`: reload the `.vimrc` file
nmap <silent> <leader>sv :so $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Tab>
" Indent
"nnoremap <Tab> >>
"vnoremap <Tab> >gv

" <Shift> + <Tab>
" Unindent
"inoremap <S-Tab> <C-D>
"imap     <S-Tab> <C-d>
"imap     <C-S-Tab> <C-d>
"nnoremap <S-Tab> <<
"vnoremap <S-Tab> <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Edition
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <mapleader> + `md`
" Convert Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>


"" `F2`: enable/unable paste mode
"set pastetoggle=<F2>

"" `Ctrl` + `d`: delete the current line
"imap <C-d> <esc>ddi
"nmap <C-d> dd

" <Ctrl> + <l>
" Clear the highlight from the last search
nnoremap <C-l> :nohlsearch<CR><C-l>
noremap! <C-l> <ESC>:nohlsearch<CR><C-l>i

" <Ctrl> + <Shift> + <l>
" Enable/Disable spell-checking
nnoremap <C-S-l> :setlocal spelllang=en_us spell! spell?<CR>

" <F11>
" Set/Unset Paste mode
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Applications
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <F9>
" Open/Close NERD Tree
map  <silent> <F9> :NERDTreeToggle<CR>
map! <silent> <F9> <ESC>:NERDTreeToggle<CR>

" <F10>
" Open/Close Tagbar
nmap <F10> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Rpdf>
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78



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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I                    " Hide the launch screen

"" Colors """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                        " Enable 256 colors
syntax on                           " Enable syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256            " Access colors present in 256 colorspace
colorscheme base16-default          " Main colorscheme
set background=dark                 " Color the background 
set cursorline                      " Highlight the current line
set number                          " Enable line numbers
set numberwidth=4                   " Line numbers column width
set showmatch                       " Highlight matching brackets
set foldcolumn=1                    " Fold Column width
set foldmethod=indent               " Indentation used for the kind of folding
set splitbelow                      " Open new window below the current window for horizontal split
set splitright                      " Open new window right the current window for vertical split

"" Search
set hlsearch                        " Highlight research results
set ignorecase                      " Ignore case when searching
set incsearch                       " Start searching during typing
set smartcase                       " If pattern contains an uppercase letter, enable case sensitive

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"" Status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                    " Print the last status

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Command bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd                         " Show command in bottom bar
set cmdheight=1                     " Command bar height

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Wild menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("wildmenu")                  " Check for compatibility
    set wildignore+=.DS_Store            " Ignore `.DS_Store` files
    set wildignore+=.git                 " Ignore `.git` files
    set wildignore+=.hg                  " Ignore `.hg` files
    set wildignore+=.svn                 " Ignore `.svn` files
    set wildignore+=*~                   " Ignore `*~` files
    set wildignore+=*.a                  " Ignore `*.a` files
    set wildignore+=*.bak,*.bmp          " Ignore `*.bak`, `*.bmp` files
    set wildignore+=*.class              " Ignore `*.class` files
    set wildignore+=*.gif                " Ignore `*.gif` files
    set wildignore+=*.hi                 " Ignore `*.hi` files
    set wildignore+=*.ico                " Ignore `*.ico` files
    set wildignore+=*.jpg,*.jpeg         " Ignore `*.jpg`, `*.jpeg` files
    set wildignore+=*.o                  " Ignore `*.o` files
    set wildignore+=*.png,*.pyc          " Ignore `*.png`, `*.pyc` files
    set wildignore+=*.swp                " Ignore `*.swp` files
    set wildignore+=*.tmp                " Ignore `*.tmp` files
    set wildmenu                         " Enhance command line completion
    set wildmode=longest:full,full       " Complete the longest possible part, then switch
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Headers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Bash (`*.sh`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.sh so $HOME/.vim/headers/sh
autocmd BufNewFile *.sh exe "1," . 9 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.sh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma" 
autocmd Bufwritepre,filewritepre *.sh exe "1," . 9 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.sh execute "normal `a" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" C
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Python (`*.py`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py so $HOME/.vim/headers/py
autocmd BufNewFile *.py exe "1," . 10 . "g/Filename:.*/s//Filename: " .expand("%")
autocmd BufNewFile *.py exe "1," . 10 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
autocmd Bufwritepre,filewritepre *.py execute "normal ma" 
autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
autocmd Bufwritepost,filewritepost *.py execute "normal `a" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Extensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash
autocmd BufNewFile,BufReadPost .bash_history set filetype=sh        " Set `.bash_history` as a Shell file
autocmd BufNewFile,BufReadPost .bash_logout  set filetype=sh        " Set `.bash_logout` as a Shell file
autocmd BufNewFile,BufReadPost .bashrc       set filetype=sh        " Set `.bashrc` as a Shell file
autocmd BufNewFile,BufReadPost .rtorrent.rc  set filetype=sh        " Set `.rtorrent.rc` as a Shell file
" HTML
autocmd BufNewFile,BufReadPost .htm          set filetype=html      " Set `*.htm` as a HTML file
" Markdown
autocmd BufNewFile,BufReadPost *.md          set filetype=markdown  " Set `*.md` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkd         set filetype=markdown  " Set `*.mkd` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkdn        set filetype=markdown  " Set `*.mkdn` as a Markdown file
autocmd BufNewFile,BufReadPost *.mdown       set filetype=markdown  " Set `*.mdown` as a Markdown file
" Sass/SCSS
autocmd BufNewFile,BufReadPost *.sass        set filetype=css       " Set `*.sass` as a CSS file
autocmd BufNewFile,BufReadPost *.scss        set filetype=css       " Set `*.scss` as a CSS file
" YAML
autocmd BufNewFile,BufReadPost .yml          set filetype=yaml      " Set `*.yaml` as a YAML file
" Gemfile/Rakefile
autocmd BufNewFile,BufReadPost Gemfile       set filetype=ruby      " Set `Gemfile` as a Ruby file
autocmd BufNewFile,BufReadPost Rakefile      set filetype=ruby      " Set `Rakefile` as a Ruby file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css      setlocal shiftwidth=2 tabstop=2           " Define indentation for `*.css`  files: 2,2
autocmd FileType haskell  setlocal shiftwidth=4 tabstop=4           " Define indentation for `*.hs`   files: 4,4
autocmd FileType html     setlocal shiftwidth=2 tabstop=2           " Define indentation for `*.html` files: 2,2
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4           " Define indentation for `*.md`   files: 4,4
autocmd FileType ruby     setlocal shiftwidth=2 tabstop=2           " Define indentation for `*.rb`   files: 2,2
autocmd FileType sh       setlocal shiftwidth=2 tabstop=2           " Define indentation for `*.sh`   files: 2,2
autocmd FileType yaml     setlocal shiftwidth=2 tabstop=2           " Define indentation for `*.yaml` files: 2,2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Spell-Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Styles
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Extensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal spell                            " Set Spell-Checking for Markdown files
