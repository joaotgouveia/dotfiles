"	Basics
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nohlsearch
set noshowmode
set number relativenumber
set cursorline
set termguicolors
filetype plugin on
syntax on
"	Remapping ç to go to the end of a line
nnoremap ç $
nnoremap cç c$
nnoremap dç d$
"	Searching for <++> in a doc, used in snippets
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"	Auto-pairs
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
"	Plugins
call plug#begin('~/.config/nvim/plugged')
	" Lightline status line
	Plug 'itchyny/lightline.vim'
	" Theme
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	" Vimwiki
	Plug 'vimwiki/vimwiki'
call plug#end()

"	Initializing theme
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }

"	C files
"	Snippets
" Standard headers
autocmd FileType c inoremap >h #include<stdio.h><Enter>#include<stdlib.h><Enter><Enter>
" Main
autocmd FileType c inoremap >m int<Space>main<Space>()<Space>{<Enter><++><Enter><Backspace>return<Space>0;<Enter>}
" Functions
autocmd FileType c inoremap >f <++><Space><++>(<++>)<Space>{<Enter><++><Enter>}
" If
autocmd FileType c inoremap >i if<Space>(<++>)<Space>{<Enter><++><Enter>}
" Else
autocmd FileType c inoremap >e else<Space>{<Enter><++><Enter>}
" While
autocmd FileType c inoremap >w while<Space>(<++>)<Space>{<Enter><++><Enter>}
" For
autocmd FileType c inoremap >c for<Space>(<++>;<Space><++>;<Space><++>)<Space>{<Enter><++><Enter>}
" Structs
autocmd FileType c inoremap >s struct<Space><++><Space>{<Enter><++><Enter>};
" Switch case
autocmd FileType c inoremap >t switch<Space>(<++>)<Space>{<Enter>case<Space><++>:<Enter><++><Enter>}
" Remapping tag jumping
autocmd FileType c nnoremap X <C-]>
"	Create tags file for tag jumping and autocomplete
autocmd! VimLeave *.c !ctags -R .
