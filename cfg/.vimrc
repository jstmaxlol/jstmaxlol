" vimrc fine shyt

" tabs are either 4 or nada
set tabstop=4
set shiftwidth=4
set expandtab
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
set nu rnu cursorline
" i forgor
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" disable mouse because who fucking needs that shit
set mouse=

" vim-plug fine shyt
call plug#begin()

" plugin list
Plug 'qaptoR-nvim/chocolatier.nvim'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'ficcdaf/ashen.nvim'
Plug 'llathasa-veleth/vim-brainfuck'

call plug#end()

" theme
set background=dark
"silent! color chocolatier
"silent! color retrobox
silent! color ashen
