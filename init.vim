call plug#begin('~/.local/share/nvim/plugged')
"Common debug plugs
Plug 'mfussenegger/nvim-dap'
"Color scheme
Plug 'arcticicestudio/nord-vim'
Plug 'Rigellute/shades-of-purple.vim'
"vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
"scala plugins
Plug 'scalameta/nvim-metals'
"Plug 'mfussenegger/nvim-dap' ruby plugins
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'

"Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'junegunn/fzf'
Plug 'elmcast/elm-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'puremourning/vimspector'
call plug#end()

"viminspector conf
let g:vimspector_enable_mappings='HUMAN'

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


nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"color scheme activate
colorscheme shades_of_purple
let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'
let g:airline#extensions#tabline#enabled = 1
"-----------------------------------------------------------------------------
" nvim-lsp Mappings
"-----------------------------------------------------------------------------
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
nnoremap <silent> <space>d    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
nnoremap <silent> <leader>rd  <cmd>lua vim.lsp.codelens.run()<CR>
nnoremap <silent> <leader>dr  <cmd>lua require("dap").repl.toggle()<CR>
nnoremap <silent> <leader>dc  <cmd>lua require("dap").continue()<CR>
nnoremap <silent> <leader>dK  <cmd>lua require("dap.ui.widgets").hover()<CR>
nnoremap <silent> <leader>dt  <cmd>lua require("dap").toggle_breakpoint()<CR>
nnoremap <silent> <leader>dso <cmd>lua require("dap").step_over()<CR>
nnoremap <silent> <leader>dsi <cmd>lua require("dap").step_info()<CR>
nnoremap <silent> <leader>dl  <cmd>lua require("dap").run_last()<CR>


"-----------------------------------------------------------------------------
" nvim-lsp Settings
"-----------------------------------------------------------------------------
" If you just use the latest stable version, then setting this isn't necessary
" let g:metals_server_version = '0.11.9+176-8a27cb58-SNAPSHOT'

"-----------------------------------------------------------------------------
" nvim-metals setup with a few additions such as nvim-completions
"-----------------------------------------------------------------------------
:lua << EOF
  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }
  vim.g.mapleader = '\\'
  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '',
      }
    }
  )

  local dap = require("dap")
  dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunMigrate",
    metals = {
      runType = "runOrTestFile",
      args = { "migrate" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "play",
    buildTarget = "play-test-build",
    metals = {
      mainClass = "app.Server",
      buildTarget = "play-test-build",
      runType = "run",
      args = {},
      jvmOptions = {"-Dconfig.file=/path/to/production.conf"}
    }
  }
}

  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end

EOF

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
  augroup end
endif

"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"-----------------------------------------------------------------------------
" Helpful general settings
"-----------------------------------------------------------------------------
" Needed for compltions _only_ if you aren't using completion-nvim
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
lua << EOF
local lsp = require "lspconfig"
local coq = require "coq" -- add this

lsp.pylsp.setup{}
lsp.pylsp.setup(coq.lsp_ensure_capabilities())
EOF

set completeopt-=preview

:lua << EOF
require("telescope").setup{  defaults = { file_ignore_patterns = { "node_modules", "venv"}} }
EOF



" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

