" Visual.
set number
set ruler

" Avoid unexpected behavior when using a different machine.
set nocompatible

" Tab length.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Indention.
set autoindent
set smartindent

if has('filetype')
	filetype indent plugin on
endif

" Enable syntax highlighting.
if has('syntax')
	syntax on
endif

" Allow usage of mouse for all modes.
if has('mouse')
	set mouse=a
endif
