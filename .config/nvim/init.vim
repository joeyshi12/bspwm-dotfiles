" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
    let g:ale_disable_lsp = 1
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_disable_transparent_cursor = 1
Plug 'preservim/nerdtree'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1 " Expand inside brackets
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:ultisnips_python_quoting_style="double"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex', {'tag': 'v1.6'}
    let g:tex_flavor = 'latex'
    let g:vimtex_quickfix_enabled = 0
    let g:vimtex_quickfix_open_on_warning = 0
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_compiler_latexmk = {'build_dir': 'build'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    set conceallevel=2
    let g:tex_conceal = 'abdmg'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
    let g:lightline = {'colorscheme': 'catppuccin'}
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
colorscheme catppuccin

" Indenting
set indentexpr="" " disable auto-inserting tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent

" Mappings
nnoremap <C-n> <cmd>tabn<cr>
nnoremap <C-p> <cmd>tabp<cr>
nnoremap <C-\> <cmd>NERDTreeToggle<cr>
inoremap <C-\> <ESC>:NERDTreeToggle<cr>
vnoremap <C-c> "+y
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <leader>ft <cmd>TableFormat<cr>
nnoremap <leader>fj <cmd>%!python -m json.tool<cr>

nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap ghp <Plug>(coc-git-chunkinfo)
nnoremap ghu <cmd>CocCommand git.chunkUndo<cr>

inoremap <nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

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
  au!
  au BufWritePre * :call TrimWhitespace()
augroup END
