" vimrc fine shyt

" tabs are either 4 or nada
set tabstop=4
set shiftwidth=4
set expandtab
set exrc secure
set virtualedit=block
" c-o-l-o-r-s-!
syntax on
filetype plugin on
" useful (i dont even use this anymore)
set backspace=indent,eol,start
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a
tnoremap <A-Esc> <C-\><C-n>
" i set this while crying because vim on windows sucks so much
" kinda useless though nvim suxx so this is still useful
" relative line numbers for life
set nu rnu cursorline
" i forgor
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" disable mouse because who fucking needs that shit
set mouse=
" for firenvim
set guifont=Comic\ Mono:h12

" vim-plug fine shyt
call plug#begin()

    " plugin list
    Plug 'qaptoR-nvim/chocolatier.nvim'
    Plug 'nvim-tree/nvim-web-devicons' 
    Plug 'ficcdaf/ashen.nvim'
    Plug 'llathasa-veleth/vim-brainfuck'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'lervag/vimtex'
    Plug 'vim-denops/denops.vim'
    Plug 'vim-skk/skkeleton'

call plug#end()

" skkeleton
" 1) global toggle stays simple and stable
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
tmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call add(g:skkeleton#mapped_keys, '<C-k>')

  call skkeleton#config({
        \ 'eggLikeNewline': v:true,
        \ })

  call skkeleton#register_keymap('input', "\<Space>", 'henkanFirst')

  call skkeleton#register_keymap('henkan', "\<Space>", 'henkanForward')

  call skkeleton#register_keymap('input', "\<C-k>", 'katakana')

  call skkeleton#register_kanatable('rom', {
        \ "z\<Space>": ["\u3000", ''],
        \ })
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END


" theme
set background=dark
"silent! color chocolatier
"silent! color retrobox
silent! color ashen

" disable BIG jumps everywhere (shift+up / shift+down act like plain arrows)
map     <S-Up>   <Up>
map     <S-Down> <Down>
nmap    <S-Up>   <Up>
nmap    <S-Down> <Down>
imap    <S-Up>   <Up>
imap    <S-Down> <Down>
vmap    <S-Up>   <Up>
vmap    <S-Down> <Down>
xmap    <S-Up>   <Up>
xmap    <S-Down> <Down>
omap    <S-Up>   <Up>
omap    <S-Down> <Down>
cmap    <S-Up>   <Up>
cmap    <S-Down> <Down>

augroup nasm_inc
    autocmd!
    autocmd BufRead,BufNewFile *.inc set filetype=nasm
augroup END

