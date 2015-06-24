set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"""""""""liuxq add begin""""""""""""
set shortmess=atI "start without AD
let &termencoding=&encoding " set terminal conding
set fileencodings=utf-8,gbk " set file enconding
set nu "show line number
set clipboard+=unnamed " press y/p can copy/paste to system clipboard
set sw=4 " shiftwidth=4
set ts=4 " tabstop=4 one tab=4 space
set et " automatic transfer tab to space
set autochdir " auto change dir
set nobackup " do not keep a backup file
"""""""""""set vim/gvim color scheme"""""""""""
if has('gui_running')
    colorscheme lucius "set gvim theme
    "let g:molokai_original = 1
    "colorscheme molokai
else
    colorscheme desert "set vim theme
endif
"""""""""""use pathogen"""""""""""""
call pathogen#infect()
""""""""in insert mode,transfer xdt to date string"""""""""""""
iab xdt <c-r>=strftime("=======20%y.%m.%d=======")<cr>
"""""""""Toggle Menu and Toolbar""""""""
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

""""""""""set NerdTree hotkey"""""""""
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"""""""""" Tlist"""""""""
let Tlist_Auto_Open=1
""""""rainbow_parentheses.vim"""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_loadcmd_toggle = 6
let g:rbpt_max = 16

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""SuperTab""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"
""""""""""""""""""""""""""""""""""""""""""""""""
" let g:syntastic_java_javac_classpath = "D:\\android-sdks\\platforms\\android-22\\*.jar;D:\\workspaceNew\\14_CustomPopupWindow\\bin\\classes"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


"""""""""liuxq add end""""""""""""
