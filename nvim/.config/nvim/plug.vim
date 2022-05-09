if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" do it later
Plug 'kyazdani42/nvim-web-devicons' " for file icons
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
Plug 'unblevable/quick-scope'
"Plug 'Yggdroot/indentLine'
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'

Plug 'rust-lang/rust.vim'

Plug 'EdenEast/nightfox.nvim' 
Plug 'rcarriga/nvim-notify' 

Plug 'puremourning/vimspector' 

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  "Plug 'glepnir/lspsaga.nvim'
  Plug 'tami5/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-autopairs'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
endif


call plug#end()
