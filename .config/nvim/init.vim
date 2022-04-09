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
let mapleader = " "
"	Remapping ç to go to the end of a line
map ç $
"	Toggle spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>
"	Searching for <++> in a doc, used in snippets
inoremap <space><space> <esc>/<++><enter>:<esc>c4l
"	Auto-pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

"	Plugins
call plug#begin('~/.config/nvim/plugged')
	" Lightline status line
	Plug 'itchyny/lightline.vim'
	" Theme
	Plug 'RRethy/nvim-base16'
	" Css colors
	Plug 'ap/vim-css-color'
	" Parser and better syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	"	Vimwiki
	Plug 'vimwiki/vimwiki'
call plug#end()
"	Initializing theme
colorscheme base16-dracula
let g:lightline = { 'colorscheme': 'solarized' }

"	Enabling treesitter highlighting
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"	Setting vimwiki default language to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"	Bash snippets
" Shebang
autocmd FileType sh inoremap >h #!/bin/bash
" If
autocmd FileType sh inoremap >i if<space>[<space><++><space>]<enter>then<enter><++><enter>fi
" For
autocmd FileType sh inoremap >c for<space><++><space>in<space><++><enter>do<enter><++><enter>done

"	C snippets
" Standard headers
autocmd FileType c inoremap >h #include<stdio.h><enter>#include<stdlib.h><enter><enter>
" Main
autocmd FileType c inoremap >m int<space>main<space>()<space>{<enter><++><enter><backspace>return<space>0;<enter>}
" Functions
autocmd FileType c inoremap >f <++><space><++>(<++>)<space>{<enter><++><enter>}
" If
autocmd FileType c inoremap >i if<space>(<++>)<space>{<enter><++><enter>}
" Else
autocmd FileType c inoremap >e else<space>{<enter><++><enter>}
" While
autocmd FileType c inoremap >w while<space>(<++>)<space>{<enter><++><enter>}
" For
autocmd FileType c inoremap >c for<space>(<++>;<space><++>;<space><++>)<space>{<enter><++><enter>}
" Structs
autocmd FileType c inoremap >s struct<space><++><space>{<enter><++><enter>};
" Switch case
autocmd FileType c inoremap >t switch<space>(<++>)<space>{<enter>case<space><++>:<enter><++><enter>}
" Remapping tag jumping
autocmd FileType c nnoremap X <C-]>
" Create tags file for tag jumping and autocomplete
autocmd! VimLeave *.c !ctags -R .
