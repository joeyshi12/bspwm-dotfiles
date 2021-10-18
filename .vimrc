" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'bignimbus/pop-punk.vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" General
set nocompatible
set noundofile
set belloff=all
set backspace=indent,eol,start
set encoding=utf-8
set pastetoggle=<F2>
set linebreak
set number
set synmaxcol=200
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow splitright
set ph=15
"colorscheme pop-punk
"hi Normal guibg=NONE ctermbg=NONE
"highlight LineNr ctermfg=NONE ctermbg=NONE
"highlight! link SignColumn LineNr
"highlight EndOfBuffer ctermfg=NONE ctermbg=NONE
set signcolumn=yes
colorscheme nord
let g:airline_theme='base16'

" Syntastic
let g:syntastic_python_flake8_args = "--max-line-length=150"
let g:syntastic_python_checkers=['flake8']

" LaTeX (vimtex/snipmate)
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = { 'build_dir': 'build' }
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   

" Mappings
nnoremap gR :%s///gc<left><left><left>
map <C-n> :tabnew<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <F5>  :set spell!<CR>
map <C-\> :NERDTreeToggle<CR>
imap <C-\> <ESC>:NERDTreeToggle<CR>
