inoremap jk <ESC>


" How to copy a selection to the OS X clipboard:
" https://stackoverflow.com/questions/677986/how-to-copy-a-selection-to-the-os-x-clipboard
set clipboard=unnamed

" map to ctrlp, avoid conflict of '<c-f>'
let g:ctrlp_map = '<c-p>'


""""""""""""""""""""
" Vundle - First clone Vundle to local:
"
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/my_plugins/Vundle.vim
"
" try
" source ~/.vimrc.plugins
" catch
" endtry
"
" End Vundle

""""""""""""""""""""
" We use vim-plug here
"
try
    source ~/.vimrc.vim-plug
catch
endtry


" Enable syntax highlighting
syntax on

" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on


""""""""""""""""""""
" Configuration List
""""""""""""""""""""
