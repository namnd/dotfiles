set clipboard=unnamedplus
set mouse=nv
set nu relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set listchars=tab:>~,nbsp:_,trail:.,eol:$
set list
set incsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
set colorcolumn=80
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set shortmess+=c

call plug#begin()

Plug 'lifepillar/vim-gruvbox8'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-dirvish'
Plug 'tmsvg/pear-tree'
Plug 'tweekmonster/startuptime.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()

" set termguicolors
colorscheme gruvbox8
set background=dark

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set splitbelow splitright
nmap <C-h> :wincmd h<cr>
nmap <C-j> :wincmd j<cr>
nmap <C-l> :wincmd l<cr>
nmap <C-k> :wincmd k<cr>

" fzf
let g:fzf_mru_relative = 1
let g:fzf_layout = {'down': '~40%'}
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let $FZF_DEFAULT_OPTS = '--reverse'
nmap <C-p> :Files<cr>
nmap <C-e> :FZFMru<cr>
nmap <C-f> :Rg<cr>
nmap <C-b> :Buffers<cr>

" dirvish - project drawer
nmap <C-n> <Plug>(dirvish_vsplit_up)
let g:dirvish_mode = ':sort ,^.*[\/],'	" sort folders at top

let mapleader=" "

nnoremap <leader>1 :e $MYVIMRC<cr>
nnoremap <leader>2 :so %<cr>
nnoremap <leader>9 :PlugInstall<cr>
nnoremap <leader>0 :PlugClean<cr>
nnoremap <leader>m :MaximizerToggle!<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>n :noh<cr>

" lsp config
:lua << END
  require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
END

nmap <silent> gd :lua vim.lsp.buf.definition()<cr>
nmap <silent> gr :lua vim.lsp.buf.references()<cr>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>do :lua vim.lsp.buf.code_action()<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
