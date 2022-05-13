set number
set ruler

set nocompatible

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent

execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

if has('filetype')
	filetype indent plugin on
endif

if has('syntax')
	syntax on
endif

if has('mouse')
	set mouse=a
endif
