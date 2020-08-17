inoremap jk <ESC>

" Vundle
" 
" First clone Vundle to local:
"
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/my_plugins/Vundle.vim
"
try
source ~/.vimrc.plugins
catch
endtry

" End Vundle



""""""""""""""""""""
" Configuration List
"
""""""""""""""""""""

" How to copy a selection to the OS X clipboard:
" https://stackoverflow.com/questions/677986/how-to-copy-a-selection-to-the-os-x-clipboard
set clipboard=unnamed

" map to ctrlp, avoid conflict of '<c-f>'
let g:ctrlp_map = '<c-p>'

