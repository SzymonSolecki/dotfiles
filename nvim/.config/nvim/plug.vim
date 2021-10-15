if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" do it later
"Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'

Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdcommenter'
Plug 'tell-k/vim-autopep8'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-autopairs'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  "Plug 'nvim-lua/completion-nvim'
endif

call plug#end()
