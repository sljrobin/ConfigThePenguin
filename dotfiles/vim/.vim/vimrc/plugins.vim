" ConfigThePenguin
" By Simon L. J. Robin | https://sljrobin.org
"
" 'plugins.vim': settings for plugins
" This file is a part for '~/.vimrc'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '|'        " Character to use for delimitation
let g:indentLine_color_term = 236  " Color of the character


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Tab>"        " <Tab>: expand a snippet
let g:UltiSnipsJumpForwardTrigger="<C-n>"   " <Ctrl> + <n>: cycle forwards through the snippets list
let g:UltiSnipsJumpBackwardTrigger="<C-p>"  " <Ctrl> + <p>: cycle backwards through the snippets list
let g:UltiSnipsEditSplit="vertical"         " Set a vertical window for editing the snippets


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_exit_from_visual_mode=0  " Quit and delete all existing cursors in Visual mode
let g:multi_cursor_exit_from_insert_mode=0  " Quit and delete all existing cursors in Normal mode


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']  " '<Ctrl> + <n>' | '<Down>': cycle forwards through the completion list
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']  " '<Ctrl> + <p>' | '<Up': cycle backwards through the completion list
let g:ycm_min_num_of_chars_for_completion=2               " Number of characters needed to be typed before completion suggestions
