call plug#begin('~/.local/share/nvim/plugged') "Common debug plugs
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
Plug 'ray-x/lsp_signature.nvim'
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
"Conf for use local project config
Plug 'folke/neoconf.nvim'
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
nnoremap <silent> <leader>se  <cmd>lua vim.diagnostic.open_float()<CR>

"-----------------------------------------------------------------------------
" nvim-lsp Settings
"-----------------------------------------------------------------------------
" If you just use the latest stable version, then setting this isn't necessary
" let g:metals_server_version = '0.11.9+176-8a27cb58-SNAPSHOT'

"-----------------------------------------------------------------------------
" nvim-metals setup with a few additions such as nvim-completions
"-----------------------------------------------------------------------------
:lua << EOF
require("neoconf").setup({
  -- override any of the default settings here
})
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

  local line_num = 5
  local col_num = 5

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        spacing = 2,
        prefix = " 🔥 ",
        -- virt_text_pos = "overlay",
        -- source = "always"
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

-- ray-x config https://github.com/ray-x/lsp_signature.nvim
ray_conf = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
                  -- the value need >= 40
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
                             -- can be either a number or function
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                              -- can be either number or function, see examples

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
  -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
  -- return 'right_align' to display hint right aligned in the current line
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
     -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
     -- may not popup when typing depends on floating_window setting

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}


lsp.pylsp.setup{}
lsp.pylsp.setup(coq.lsp_ensure_capabilities())


require'lsp_signature'.setup(rayx_conf)

EOF

set completeopt-=preview

:lua << EOF
require("telescope").setup{  defaults = { file_ignore_patterns = { "node_modules", "venv"}} }
EOF


