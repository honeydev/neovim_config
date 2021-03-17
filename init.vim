call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'

call plug#end()

let g:deoplete#enable_at_startup = 1
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set number
autocmd VimEnter * NERDTree
