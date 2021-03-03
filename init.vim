" my nvim nightly is in /usr/local/bin
syntax on
 
" :options 
" :h option
set nohlsearch     " don't highlight things when I search for them
set noerrorbells   " no more sound effects when going to the end of a line
set ts=4           " <Tab> takes up 4 spaces
set softtabstop=4  " <Tab> takes up 4 spaces while performing editing operations
set shiftwidth=4   " the vim > command shifts things by 4 spaces
set scrolloff=10   " start scrolling the page when you're 8 lines away from the bottom
set expandtab      " converts tabs into spaces
set smartindent    " auto-indent
set nowrap         " don't wrap the lines
set smartcase      " do case insensitive searching until I put in a capital letter
set incsearch      " search incrementally
set ignorecase     " makes smartcase work (ignore the case)
set noswapfile     " don't create vim.swap files everywhere
set nobackup       " don't keep a backup file
set hidden         " keeps all your buffers open
set confirm        " asks me if I want to quit the current buffer or not
set statusline=2   " give me a status bar
set nu             " line numbers
set relativenumber 
set signcolumn=yes " add a column to the left so errors can show up there
set clipboard=unnamedplus    " set vim clipboard to system clipboard
set completeopt=menuone,noinsert,noselect " one menu only and don't insert for me
" set undodir=~/.vim/undodir " keep an undodir 
" set undofile               " there should be an undofile for every file I edit

" PlugInstall, PlugClean, PlugUpdate, PlugUpgrade
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'       " stylish status-line
Plug 'preservim/nerdtree'            " file explorer
Plug 'gruvbox-community/gruvbox'     " color scheme
Plug 'dbeniamine/cheat.sh-vim'       " :Cheat topic
Plug 'tomlion/vim-solidity'          " syntax highlighting for solidity
Plug 'tpope/vim-fugitive'            " Git Support
Plug 'nvim-lua/completion-nvim'      " LSP
Plug 'neovim/nvim-lspconfig'         " autocomplete
Plug 'nvim-lua/popup.nvim'           " required for telescope
Plug 'nvim-lua/plenary.nvim'         " required for telescope
Plug 'nvim-telescope/telescope.nvim' " searches for files using fuzzy search
Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion

call plug#end()

colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" let is for setting variables and set is for setting options
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Load language servers
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.tsserver.setup{ on_attach=require'completion'.on_attach }
lspconfig.pyright.setup{}
lspconfig.solargraph.setup{}
lspconfig.bashls.setup{}
lspconfig.jdtls.setup{}
lspconfig.gopls.setup{}
EOF

" My remaps
noremap! <C-BS> <C-w> 
noremap! <C-h> <C-w>
nnoremap <SPACE> <C-W>
inoremap <C-Z> <C-U>

nnoremap <SPACE>e :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :tabedit<CR>
nnoremap <leader>T :tabclose<CR>

" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search })
" Find files using Telescope command-line sugar.
nnoremap <C-P> <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
