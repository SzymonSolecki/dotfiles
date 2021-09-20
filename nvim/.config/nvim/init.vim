" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

let mapleader = " "

set nocompatible
set mouse=a
set hidden
set guicursor=
set noshowmode
set number
set ignorecase
set smartcase
set relativenumber
syntax on
syntax enable
set ruler
filetype plugin indent on
filetype indent on
set history=500
set showmatch
set cursorline
set cursorcolumn
set tm=500
set encoding=utf8
set ffs=unix,dos,mac
set incsearch
set listchars=eol:¬\,space:·\,extends:›
set wrapscan
set hlsearch
hi Search ctermbg=red
hi Search ctermfg=white
set scrolloff=8
set timeoutlen=1000 ttimeoutlen=500

" spaces over tabs forever
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}
set textwidth=80
set colorcolumn=+1

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm

" Don't redraw while executing macros (good performance config)
set lazyredraw

set smarttab

set backspace=start,eol,indent

set foldmethod=marker
set foldlevel=0
set ai "Auto indent
set si "Smart indent

" Add asterisks in block comments
set formatoptions+=r

" vim-session config
let g:session_autosave = 'no'
set clipboard=unnamedplus
"}}}

" File types "{{{
" ---------------------------------------------------------------------

autocmd FileType javascript,html,css setlocal ts=2 sw=2 expandtab

autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd FileType python nnoremap <F6> :w<CR>:vsplit term://python3 %<CR>
autocmd FileType python nnoremap <F5> :w<CR>:exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap = :Autopep8<CR>
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
autocmd FileType tex nnoremap <F5> :w<CR>:VimtexCompileSS<CR>
autocmd FileType html nnoremap <F5> :w<CR>:!xdg-open %<CR>

"}}}

" Imports "{{{
" ---------------------------------------------------------------------

runtime ./plug.vim
runtime ./maps.vim

"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

"colorscheme gruvbox
"colorscheme darcula
"colorscheme hybrid
"colorscheme horizon
"colorscheme molokai
"colorscheme palenight
"colorscheme landscape

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

"ayu colorscheme colors
"let ayucolor="dark"
let ayucolor="mirage"
colorscheme ayu

" nvim stuff
if (empty($TMUX))
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
endif

if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

"}}}

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
