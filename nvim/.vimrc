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

" Plug Begin ___________________________________________________________________
call plug#begin('~/.vim/autoload')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'

Plug 'chrisbra/Colorizer'
Plug 'sheerun/vim-polyglot' 
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'tell-k/vim-autopep8'
Plug 'ntk148v/vim-horizon'
Plug 'joshdick/onedark.vim'
Plug 'vim-python/python-syntax'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'unblevable/quick-scope'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'

call plug#end()
"Plug end______________________________________________________________________

" Colorshemes _________________________________________________________________
"colorscheme gruvbox
"colorscheme ayu
"colorscheme darcula
"colorscheme hybrid
"colorscheme horizon
colorscheme molokai

"colorscheme palenight
"colorscheme landscape

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

"ayi colorscheme colors
let ayucolor="dark"
"let ayucolor="mirage"

set background=dark

" Colorshemes END _____________________________________________________________



" General settings ____________________________________________________________
let mapleader = " "

set nocompatible
set mouse=a
set hidden
set guicursor=
set noshowmode
set foldmethod=marker
set foldlevel=0
set autoindent
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
set completeopt=noinsert,menuone,noselect,preview

" General settings END ________________________________________________________

" Fixers and compile/execute __________________________________________________
"nnoremap = :call CocAction('format')<CR>
nnoremap = :ALEFix<CR>

autocmd FileType javascript,html,css setlocal ts=2 sw=2 expandtab
let g:autopep8_disable_show_diff=1

autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd FileType python nnoremap <F6> :w<CR>:vsplit term://python3 %<CR>
autocmd FileType python nnoremap <F5> :w<CR>:exec '!python' shellescape(@%, 1)<cr>
autocmd FileType tex nnoremap <F5> :w<CR>:VimtexCompileSS<CR>
autocmd FileType html nnoremap <F5> :w<CR>:!xdg-open %<CR>
" Fixers END __________________________________________________________________

" color highlightning toggle
map <leader>h :ColorToggle<CR>

" put semicolon on the end of the line
inoremap ;; <Esc>A;<Esc>

" use jk/kj as esc
inoremap jk <Esc>
inoremap kj <Esc>

"NerdTree
map <leader>o :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"show whitespaces
nmap <leader>l :set list!<CR>
"set list

"turn off highlight after search
map <F2> :noh<CR>

"save bind
map <C-s> :wa!<CR>

" Moving between tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

"Copy to clipboard
vnoremap <C-c> "+y
noremap <C-p> "+P

" adding blank lines above or below
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" At the beggining it forced me to use vim mapping. ¯\_(ツ)_/¯
noremap <Up> <Nop> 
noremap <Down> <Nop> 
noremap <Left> <Nop> 
noremap <Right> <Nop> 

" alow indent whole block at once
vnoremap < <gv
vnoremap > >gv

" folding with space
nnoremap <space> za

" switch splits and buffers with one key
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-^>

" mapping to open files.
noremap <leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vimrc<CR>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" indentLine color
"let g:indentLine_color_gui = '#A4E57E'

let g:python3_host_prog = '/usr/bin/python3'

" Enables vim rainbow brackets
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerd commenter settings
let g:NERDCompactSexyComs = 1
map <C-_> <plug>NERDCommenterToggle
let g:pymode_rope = 0

" vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdmg"
let g:vimtex_compiler_progname = 'nvr'

" EMMET VIM SETTINGS
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" PRETTIER CONFIG
let g:prettier#config#bracket_spacing = 'true'

" AIRLINE CONFIG
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "tokyonight"

"Ale config
let g:ale_linters = {
\   'c': ['ccls', 'clang'],
\   'cpp': ['clang'],
\   'javascript': ['eslint'],
\   'php': ['php'],
\   'python': ['pyls', 'flake8'],
\}

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'php': ['prettier'],
\   'python': ['autopep8'],
\   'scss': ['prettier'],
\}

let g:pymode_python = 'python3'

" COC config

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"vmap = <Plug>(coc-format-selected)
"nmap = <Plug>(coc-format-selected)

" ads blank line on enter when using brackets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc snips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
imap <S-Tab> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

" fzf preview
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]b :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]s :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> [fzf-p]S :<C-u>CocCommand fzf-preview.Buffers<CR>

" quickscope plugin config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-session config
let g:session_autosave = 'no'
set clipboard=unnamedplus

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
if exists('$TMUX')
   " set insert mode to a cyan vertical line   
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[6 q\<esc>\\"
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;cyan\x7\<esc>\\"
   " set normal mode to a green block
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;green\x7\<esc>\\"
   " set replace mode to an orange underscore
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;orange\x7\<esc>\\"

   " initialize cursor shape/color on startup (silent !echo approach doesn't seem to work for tmux)
   augroup ResetCursorShape
      au!
      autocmd VimEnter * startinsert | stopinsert
      autocmd VimEnter * normal! :startinsert :stopinsert
      autocmd VimEnter * :normal :startinsert :stopinsert
   augroup END

   " reset cursor when leaving tmux
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
endif
