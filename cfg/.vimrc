" vimrc fine shyt

let g:editorconfig = 0
filetype plugin on
" tabs are either 4 or nada
filetype indent off
set tabstop=4
set shiftwidth=4
set expandtab
set exrc secure
set virtualedit=block
" c-o-l-o-r-s-!
syntax on
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

"add time at the right of status bar thing
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{strftime(\"%Y年%m月%d日\ %H時%M分%S秒\")}

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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'windwp/nvim-autopairs'
    Plug 'zenlang/zen.vim'

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

lua << EOF
require('nvim-autopairs').setup{}
EOF

" === coc.nvim config ===
let g:coc_global_extensions = ['coc-clangd', 'coc-html', 'coc-tsserver', 'coc-sh', 'coc-css', 'coc-pyright', 'coc-go']
"
hi CocErrorSign guifg=Red
hi CocErrorVirtualText guifg=Red
hi CocErrorHighlight cterm=underline gui=undercurl guisp=Red
" use undercurl for errors
autocmd CursorHold * silent call CocActionAsync('highlight')
" show diagnostics thingy on cursor hold
"autocmd CursorHold * silent call CocActionAsync('doHover')
" <tab> triggers completion and navigates in completion menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <CR> confirms completion
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
" function signature while typing
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" indentation stuff for js/ts because i guess so
autocmd FileType javascript,typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript,typescript setlocal indentexpr=

" zen-c filetype detection (w zuhaitz)
au BufRead,BufNewFile *.zc set filetype=zen


