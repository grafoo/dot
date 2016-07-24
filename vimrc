set nocompatible
filetype plugin indent on
set relativenumber
syntax on
set background=dark

" tabs vs spaces
set expandtab " insert space characters whenever the tab key is pressed
set tabstop=4 " number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4 " number of space characters inserted for indentation
set softtabstop=4 " makes the backspace key treat four spaces like a tab

autocmd FileType gitcommit setlocal formatoptions+=t textwidth=72
autocmd FileType make setlocal noexpandtab
