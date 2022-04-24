" Basics
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nohlsearch
set noshowmode
set noshowcmd
set noruler
set number relativenumber
set cursorline
set termguicolors
set ignorecase
set smartcase
set clipboard+=unnamedplus
filetype plugin on
syntax on
let mapleader = " "

" Centering doc after entering insert mode
autocmd InsertEnter * norm zz

" Remove trailling whitespace
autocmd BufWritePre * %s/\s\+$//e

" Auto commenting disabled by default
autocmd FileType * setlocal formatoptions-=cro

" Remapping tag jumping
nnoremap X <C-]>

" Remapping auto-completion
inoremap <leader><CR> <C-n>

" Visual mode bind is v-block
noremap v <C-v>

" Remapping ç to go to the end of a line and s to beginning
map ç $
map s 0

" Making the maps for J and K make sense
map J L
map K H

" Remapping undo to t
noremap t u

" Remapping paragraph jumps to u and i
map u }
map i {

" Toggle spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Enable and disable auto comments
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Splits open at the bottom and right
set splitbelow splitright

" Split navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split opening shortcuts
noremap <leader>v :vsplit<space>

" Auto-pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap ` ``<left>

" Plugins
call plug#begin('~/.config/nvim/plugged')
	" Lightline status line
	Plug 'itchyny/lightline.vim'
	" Theme
	Plug 'RRethy/nvim-base16'
	" Css colors
	Plug 'ap/vim-css-color'
	" Parser and better syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Vimwiki
	Plug 'vimwiki/vimwiki'
	" Surround manipulation
	Plug 'tpope/vim-surround'
	" Comment manipulation
	Plug 'tpope/vim-commentary'
	" Git integration
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Gitgutter settings
noremap <leader>g :GitGutterSignsToggle<CR>
" Cycle hunks
map <leader>nh :GitGutterNextHunk<CR>
map <leader>ph :GitGutterPrevHunk<CR>

" Initializing theme
colorscheme base16-material-palenight
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'filetype' ],
      \              [ 'fileencoding' ] ]
      \ },
      \ }
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
inoremap <leader><leader> <esc>/<++><enter>:<esc>c4l

" Snippets
" Bash
" Shebang
autocmd FileType sh inoremap >h #!/bin/bash
" If
autocmd FileType sh inoremap >i if<space>[<space><++><space>]<enter>then<enter><++><enter>fi
" For
autocmd FileType sh inoremap >c for<space><++><space>in<space><++><enter>do<enter><++><enter>done

" C
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
" Create tags file for tag jumping and autocomplete
autocmd! VimLeave *.c !ctags -R .
