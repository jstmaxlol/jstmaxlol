"                  _                    
"   ___ ______   _(_)_ __ ___  _ __ ___ 
"  / __|_  /\ \ / / | '_ ` _ \| '__/ __|
" | (__ / / _\ V /| | | | | | | | | (__ 
"  \___/___(_)\_/ |_|_| |_| |_|_|  \___|
"                                       
" czvimrc -- ideally do *not* use this on vim
" i added a lot of stuff that vim hates here
" since i switched to neovim like last year.
" -------------------------------------------
" von czjstmax <jstmaxlol at disroot dot org>
" -------------------------------------------

" -------- 'a ---------
" file settings
filetype plugin on
filetype indent off
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" config stuff
let g:editorconfig = 0
set exrc secure
" tab sets
set tabstop=4
set shiftwidth=4
set expandtab
" layout-ish stuff
set splitright splitbelow
nnoremap <C-w>n :vnew<CR>
" more commodities set
set virtualedit=block
set backspace=indent,eol,start
" i dont really do C-S anymore
" but it's here as a fallback 
" in case my muscle memory gets
" un-vimmed from idk an incident xd
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a
" because fuck C-\ C-n
" i use :term too much lol
tnoremap <A-Esc> <C-\><C-n>
syntax on

" -------- 'b ---------
" i set this while crying because vim on windows sucks so much
" kinda useless though nvim suxx so this is still useful
" relative line numbers for life
set nu rnu cursorline
" disable mouse because who fucking needs that shit HAH
set mouse=
" for firenvim
set guifont=Iosevka:h12
:command! Nobg hi Normal guibg=NONE ctermbg=NONE
" leader
let mapleader = ","

" -------- 'c ---------
command! Src source ~/.vimrc
command! Vimrc edit ~/.vimrc
" the coolest regex-es you'll see (fake as fuck)
command! RmComments %s/\s*\/\/\s*.*//
" -------- 'C ---------

"add time at the right of status bar thing
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{strftime(\"%Y年%m月%d日\ %H時%M分%S秒\")}

" for vim-polyglot
set nocompatible

" -------- 'p ---------
" vim-plug      section
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
    Plug 'sheerun/vim-polyglot'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-neo-tree/neo-tree.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'kylechui/nvim-surround'
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'

call plug#end()
" -------- 'P ---------

nnoremap <leader>gg :LazyGit<CR>
nnoremap <leader>e :Neotree toggle<CR>

nnoremap <leader>hp :Gitsigns preview_hunk<CR>
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

lua << EOF
    require("nvim-surround").setup({})
    require('Comment').setup()
EOF

" -------- 'k ---------
"       skkeleton
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

" -------- 't ---------
"         theme
set background=dark
"silent! color chocolatier
"silent! color retrobox
silent! color ashen
"silent! color monokai_pro
" -------- 'T ---------

lua << EOF
    require("bufferline").setup{
        options = {
            themable = true,
        }
    }
EOF

nnoremap <leader>t :enew<CR>
nnoremap <leader>q :BufferLinePickClose<CR>
nnoremap <Tab> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <leader>pick :BufferLinePick<CR>

" -------- 'd ---------
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

" -------- 'e ---------
augroup nasm_inc
    autocmd!
    autocmd BufRead,BufNewFile *.inc set filetype=nasm
augroup END

" genius idea i came up with
augroup fuck_ftdetect
  autocmd!
  autocmd TextChanged,InsertLeave * if &ft == '' | filetype detect | endif
augroup END

lua << EOF
require('nvim-autopairs').setup{}
EOF

" -------- 'f ---------
" === coc.nvim config ===
let g:coc_global_extensions = ['coc-clangd', 'coc-html', 'coc-tsserver', 'coc-sh', 'coc-css', 'coc-pyright', 'coc-go']
let g:coc_user_config = {'clangd.inlayHints.enable': v:false}
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

" -------- 'g ---------
" zen-c filetype detection (w zuhaitz)
au BufRead,BufNewFile *.zc set filetype=zen

" reborn filetype detection
" temporarily set to filetype=c
au BufRead,BufNewFile *.rn set filetype=c
au BufRead,BufNewFile *.rh set filetype=c

" -------- 'h ---------
lua << EOF
    local lualine_bg = "#212121"

    local function jp_time()
        return os.date("%Y年%m月%d日 %H時%M分%S秒")
    end

    local function mode()
        local m = vim.fn.mode()

        local map = {
            n = "n / ノーマル",
            i = "i / インサート",
            v = "v / ビジュアル",
            V = "v / ビジュアル",
            ["\22"] = "v / ビジュアル",
            c = "c / コマンド",
            R = "r / リプレイス",
            t = "t / ターミナル",
        }

        return map[m] or m
    end

    local palette = {
        "#f82323",
        "#e13b3b",
        "#c85656",
        "#a96a6a",
        "#8b7a7a",
        "#6f7a6a",
        "#5f6a6a",
        "#808080",
        "#5f6a6a",
        "#6f6a6a",
        "#8b7a7a",
        "#a96a6a",
        "#c85656",
        "#e13b3b",
    }

    local function get_color()
        local i = math.floor(vim.loop.hrtime() / 1e8) % #palette + 1
        return palette[i]
    end

    local function bg()
        return lualine_bg
    end

    local function lualine_theme()
        local bg = lualine_bg

        return {
            normal = { a = { bg = bg, fg = "#ffffff" }, b = { bg = bg, fg = "#ffffff" }, c = { bg = bg } },
            insert = { a = { bg = bg, fg = "#ffffff" }, b = { bg = bg, fg = "#ffffff" }, c = { bg = bg } },
            visual = { a = { bg = bg, fg = "#ffffff" }, b = { bg = bg, fg = "#ffffff" }, c = { bg = bg } },
            replace = { a = { bg = bg, fg = "#ffffff" }, b = { bg = bg, fg = "#ffffff" }, c = { bg = bg } },
            command = { a = { bg = bg, fg = "#ffffff" }, b = { bg = bg, fg = "#ffffff" }, c = { bg = bg } },
            inactive = { a = { bg = bg, fg = "#888888" }, b = { bg = bg, fg = "#888888" }, c = { bg = bg } },
        }
    end

    require('lualine').setup({
        options = {
            theme = lualine_theme(),
            icons_enabled = true,
            globalstatus = true,
            component_separators = { left = '//', right = '//' },
            section_separators = { left = '', right = '' },
        },

        sections = {

            lualine_a = {
                {
                    mode,
                    color = function()
                        return { fg = get_color(), bg = lualine_bg, gui = "bold" }
                    end
                }
            },

            lualine_b = {
                {
                    'branch',
                    color = function() return { bg = lualine_bg, fg = "#ffffff" } end
                },
                {
                    'diff',
                    color = function() return { bg = lualine_bg } end
                }
            },

            lualine_c = {
                {
                    'filename',
                    path = 1,
                    color = function() return { bg = lualine_bg, fg = "#ffffff" } end
                }
            },

            lualine_x = {
                {
                    'diagnostics',
                    color = function() return { bg = lualine_bg } end
                },
                {
                    'encoding',
                    color = function() return { bg = lualine_bg } end
                },
                {
                    'fileformat',
                    color = function() return { bg = lualine_bg } end
                },
            },

            lualine_y = {
                {
                    'filetype',
                    color = function() return { bg = lualine_bg, fg = "#ffffff" } end
                }
            },

            lualine_z = {
                {
                    jp_time,
                    color = function() return { bg = lualine_bg } end
                }
            },
        },
    })
EOF

lua << EOF
local toggle = true

vim.keymap.set("n", "<C-w>n", function()
  if toggle then
    vim.cmd("vnew") -- right
  else
    vim.cmd("new")  -- bottom
  end
  toggle = not toggle
end, { silent = true })
EOF

