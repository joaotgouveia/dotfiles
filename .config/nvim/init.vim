" Basics
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

" Remapping ç to go to the end of a line and s to beggining
map ç $
map s 0

" Remapping undo to t
noremap t u

" Remapping paragraph jumps to u and i
map u }
map i {

" Toggle spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
set splitbelow splitright

" Split navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto-pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

" Plugins
call plug#begin('~/.config/nvim/plugged')
	" Lightline status line
	Plug 'itchyny/lightline.vim'
	" Theme
	Plug 'RRethy/nvim-base16'
	" Icons
	"Plug 'ryanoasis/vim-devicons'
	" Css colors
	Plug 'ap/vim-css-color'
	" Parser and better syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	"	Vimwiki
	Plug 'vimwiki/vimwiki'
call plug#end()

" Initializing theme
colorscheme base16-material-palenight
let g:lightline = { 'colorscheme': 'wombat' }

" Enabling treesitter highlighting
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Setting vimwiki default language to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Searching for <++> in a doc, used in snippets
inoremap <space><space> <esc>/<++><enter>:<esc>c4l

" Snippets
" Bash
" Shebang
autocmd FileType sh inoremap >h #!/bin/bash
" If
autocmd FileType sh inoremap >i if<space>[<space><++><space>]<enter>then<enter><++><enter>fi<space><space>
" For
autocmd FileType sh inoremap >c for<space><++><space>in<space><++><enter>do<enter><++><enter>done<space><space>

" C
" Standard headers
autocmd FileType c inoremap >h #include<stdio.h><enter>#include<stdlib.h><enter><enter>
" Main
autocmd FileType c inoremap >m int<space>main<space>()<space>{<enter><++><enter><backspace>return<space>0;<enter>}<space><space>
" Functions
autocmd FileType c inoremap >f <++><space><++>(<++>)<space>{<enter><++><enter>}<space><space>
" If
autocmd FileType c inoremap >i if<space>(<++>)<space>{<enter><++><enter>}<space><space>
" Else
autocmd FileType c inoremap >e else<space>{<enter><++><enter>}<space><space>
" While
autocmd FileType c inoremap >w while<space>(<++>)<space>{<enter><++><enter>}<space><space>
" For
autocmd FileType c inoremap >c for<space>(<++>;<space><++>;<space><++>)<space>{<enter><++><enter>}<space><space>
" Structs
autocmd FileType c inoremap >s struct<space><++><space>{<enter><++><enter>};<space><space>
" Switch case
autocmd FileType c inoremap >t switch<space>(<++>)<space>{<enter>case<space><++>:<enter><++><enter>}<space><space>
" Remapping tag jumping
autocmd FileType c nnoremap X <C-]>
" Create tags file for tag jumping and autocomplete
autocmd! VimLeave *.c !ctags -R .
