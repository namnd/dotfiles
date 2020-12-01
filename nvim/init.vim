set clipboard=unnamedplus
set mouse=nv
set nu relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set listchars=tab:>~,nbsp:_,trail:.,eol:$
set list
set incsearch
set nowrap
set noswapfile
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=50
set undodir=~/.vim/undodir
set undofile
set cursorline
set colorcolumn=81
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set foldmethod=indent
set nofoldenable

call plug#begin()

" Plug 'lifepillar/vim-gruvbox8'
Plug 'gruvbox-community/gruvbox'
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
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

call plug#end()

set termguicolors
colorscheme gruvbox
set background=dark

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap jj <esc>
" selects til end of line (exclude newline)
vnoremap v $h 
nnoremap Y y$
" swap highlighted text with last deleted text
xnoremap <C-x> <Esc>`.``gvP``P
 
let mapleader=" "

set splitbelow splitright
nmap <C-h> :wincmd h<cr>
nmap <C-j> :wincmd j<cr>
nmap <C-l> :wincmd l<cr>
nmap <C-k> :wincmd k<cr>
nmap <C-s> :w<cr>
nmap <C-x> :wincmd x<cr>
nmap <C-c> :wincmd o<cr>

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

nnoremap <leader>11 :e $MYVIMRC<cr>
nnoremap <leader>12 :vs $MYVIMRC<cr>
nnoremap <leader>13 :tab sp $MYVIMRC<cr>
nnoremap <leader>2 :so $MYVIMRC<cr>
nnoremap <leader>9 :PlugInstall<cr>
nnoremap <leader>0 :PlugClean<cr>
nnoremap <leader>mm :MaximizerToggle!<cr>
nnoremap <leader>uu :UndotreeToggle<cr>
nnoremap <leader>nn :noh<cr>

" lsp config
" lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
" lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}

nmap <silent> g1f :wincmd F<cr> :wincmd K<cr> :wincmd r<cr>
nmap <silent> g2f :wincmd F<cr> :wincmd H<cr> :wincmd r<cr>

" nmap <silent> gd :lua vim.lsp.buf.definition()<cr>
" nmap <silent> g1d :wincmd s<cr> :lua vim.lsp.buf.definition()<cr>
" nmap <silent> g2d :wincmd v<cr> :lua vim.lsp.buf.definition()<cr>
" nmap <silent> gr :lua vim.lsp.buf.references()<cr>

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" nnoremap <leader>ca :lua vim.lsp.buf.code_action()<cr>
" nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>rp yiw<esc>:%s/<C-r>+//gc<left><left><left>
nnoremap <leader>rg :Rg <C-R>=expand('<cword>')<cr><cr>

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> g1d :sp<cr> <Plug>(coc-definition)
nmap <silent> g2d :vs<cr> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

let g:coc_global_extension = [
      \ 'coc-tsserver'
      \]
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extension += ['coc-eslint']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extension += ['coc-prettier']
endif

function! s:init_ts() abort
  nmap <leader>tt :vsplit term://npm test<cr>
  nmap <leader>ll :vsplit term://npm run lint<cr>
endfunction
autocmd FileType typescript,typescript.tsx :call s:init_ts()
autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <c-r><c-g><cr>
" autocmd BufWritePost *.ts,*.tsx lua vim.lsp.buf.formatting()
autocmd VimResized * :wincmd =
autocmd Filetype json let g:indentLine_enabled = 0

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=81
  autocmd WinLeave * set colorcolumn=0
augroup END

augroup HighlightYank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END
