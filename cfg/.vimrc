" vimrc fine shyt

" tabs are either 4 or nada
set tabstop=4
set shiftwidth=4
" c-o-l-o-r-s-!
syntax on
filetype plugin on
" useful (i dont even use this anymore)
set backspace=indent,eol,start
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a
" i set this while crying because vim on windows sucks so much
" kinda useless though nvim suxx so this is still useful
set guicursor=n-v-c-i:block
" relative line numbers for life
set nu rnu
" i forgor
set encoding=utf-8
set fileencoding=utf-8

" vim-plug fine shyt
call plug#begin()

" plugin list
Plug 'qaptoR-nvim/chocolatier.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

" theme
set background=dark
silent! colorscheme chocolatier
