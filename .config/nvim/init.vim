" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lervag/vimtex', {'tag': 'v1.6'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
call plug#end()

" General
syntax on
filetype plugin indent on
set nocompatible
set noundofile
set belloff=all
set backspace=indent,eol,start
set encoding=utf-8
set linebreak
set number
set splitbelow splitright
set pumheight=15
set signcolumn=yes
let delimitMate_expand_cr = 2 " Expand inside brackets

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_quoting_style="double"

" LSP
let g:ale_disable_lsp = 1
let g:coc_node_path = '~/.nvm/versions/node/v17.5.0/bin/node'
let g:coc_disable_transparent_cursor = 1
if $CONDA_PREFIX == ""
  let s:current_python_path=$CONDA_PYTHON_EXE
else
  let s:current_python_path=$CONDA_PREFIX.'/bin/python'
endif
call coc#config('python', {'pythonPath': s:current_python_path})

" Indenting
set indentexpr="" " disable auto-inserting tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent

" Colour scheme
colorscheme catppuccin
let g:lightline = {'colorscheme': 'catppuccin'}

" LaTeX
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = {'build_dir': 'out'}
set conceallevel=2
let g:tex_conceal = 'abdmg'

" Mappings
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>
nmap <C-\> :NERDTreeToggle<CR>
imap <C-\> <ESC>:NERDTreeToggle<CR>
vmap <C-c> "+y
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Autocommands
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
