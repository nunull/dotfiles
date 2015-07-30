" Fish compatibility
if &shell =~# 'fish$'
	set shell=sh
end

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'dag/vim-fish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
syntax enable
filetype plugin on

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'

" Custom
set tabstop=4
set autoindent
set relativenumber
set laststatus=2
let g:netrw_liststyle=3
syntax on
