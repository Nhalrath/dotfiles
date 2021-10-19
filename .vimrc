" Avoid unexpected behavior when using a different machine.
set nocompatible

set number

" Tab length
set tabstop=4
set softtabstop=4
set expandtab

" Auto indent for specific filetypes.
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
