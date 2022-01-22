" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install()} }
Plug 'preservim/nerdtree'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'joeyshi12/vim-snippets'
" downgrade vimtex to avoid conflicts with tex-conceal
Plug 'lervag/vimtex', {'tag': 'v1.6'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
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
let delimitMate_expand_cr=2 " Expand inside brackets
let g:coc_node_path = '~/.nvm/versions/node/v17.0.1/bin/node'
let g:ale_disable_lsp = 1

" Indenting
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent

" Colour scheme
let g:onedark_termcolors=256
let g:airline_theme='onedark'
colorscheme onedark
highlight Normal guibg=NONE ctermbg=NONE

" LaTeX
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = { 'build_dir': 'build' }
set conceallevel=2
let g:tex_conceal='abdmg'
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Mappings
cmap w!! w !sudo tee %
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>
nmap <C-\> :NERDTreeToggle<CR>
imap <C-\> <ESC>:NERDTreeToggle<CR>
" gvim should be installed for copy-to-clipboard to work
vmap <C-c> "+y
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap ghp <Plug>(GitGutterPreviewHunk)

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
