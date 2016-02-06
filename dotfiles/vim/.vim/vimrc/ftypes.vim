" ConfigThePenguin
" By Simon L. J. Robin | https://sljrobin.org
"
" 'ftypes.vim': options for filetypes
" This file is a part for '~/.vimrc'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash
autocmd BufNewFile,BufReadPost .bash_history set filetype=sh        " Set `.bash_history` as a Shell file
autocmd BufNewFile,BufReadPost .bash_logout  set filetype=sh        " Set `.bash_logout` as a Shell file
autocmd BufNewFile,BufReadPost .bashrc       set filetype=sh        " Set `.bashrc` as a Shell file
autocmd BufNewFile,BufReadPost .rtorrent.rc  set filetype=sh        " Set `.rtorrent.rc` as a Shell file
autocmd BufNewFile,BufReadPost .vimrc        set filetype=vim       " Set `.vimrc` as a vim file

" Gemfile/Rakefile
autocmd BufNewFile,BufReadPost Gemfile       set filetype=ruby      " Set `Gemfile` as a Ruby file
autocmd BufNewFile,BufReadPost Rakefile      set filetype=ruby      " Set `Rakefile` as a Ruby file

" HTML
autocmd BufNewFile,BufReadPost *.htm         set filetype=html      " Set `*.htm` as a HTML file

" Markdown
autocmd BufNewFile,BufReadPost *.md          set filetype=markdown  " Set `*.md` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkd         set filetype=markdown  " Set `*.mkd` as a Markdown file
autocmd BufNewFile,BufReadPost *.mkdn        set filetype=markdown  " Set `*.mkdn` as a Markdown file
autocmd BufNewFile,BufReadPost *.mdown       set filetype=markdown  " Set `*.mdown` as a Markdown file

" Sass/SCSS
autocmd BufNewFile,BufReadPost *.sass        set filetype=css       " Set `*.sass` as a CSS file
autocmd BufNewFile,BufReadPost *.scss        set filetype=css       " Set `*.scss` as a CSS file

" YAML
autocmd BufNewFile,BufReadPost *.yml         set filetype=yaml      " Set `*.yml` as a YAML file
