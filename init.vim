call plug#begin('~/.local/share/nvim/plugged')

Plug 'slim-template/vim-slim'
"ruby plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'


"search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'elmcast/elm-vim'
call plug#end()

let g:deoplete#enable_at_startup = 1
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set number

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

autocmd VimEnter * NERDTree
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
    \ }

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2


nmap ~ :NERDTreeToggle<CR> “ open/close nerdtree window
nmap <leader>r :NERDTreeFind<cr> “ this is the key to jump to the nerdtree window from any other window
nmap ] :NERDTreeFind<CR> “ pressing this inside any open file in vim will jump to the nerdtree and highlight where that file is -> very useful when you have multiple files open at once
autocmd BufWinEnter * NERDTreeFind

nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
