" Description: Keymaps

inoremap <C-c> <Esc>

" color highlightning toggle
map <leader>h :ColorToggle<CR>

" put semicolon on the end of the line
inoremap ;; <Esc>A;<Esc>

" use jk/kj as esc
inoremap jk <Esc>
inoremap kj <Esc>

"NerdTree
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

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

" move blocks up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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

" mapping to open files.
noremap <leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vimrc<CR>

nnoremap <leader>fs :FzfPreviewProjectFiles<CR>

" quickscope plugin config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Enables vim rainbow brackets
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerd commenter settings
let g:NERDCompactSexyComs = 1
map <C-_> <plug>NERDCommenterToggle
let g:pymode_rope = 0

" EMMET VIM SETTINGS
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" AIRLINE CONFIG
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = "tokyonight"

"let g:pymode_python = 'python3'

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-^>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

set shortmess+=c
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
