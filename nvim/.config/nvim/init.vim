if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


"*****************************************************************************
"" Plugins
"*****************************************************************************
call plug#begin(expand('~/.config/nvim/plugged'))

"" Vim helpers/enhancement
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vista.vim' " like tagbar, but with LSP support
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Focus mode
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-peekaboo' " helper for register peaking
Plug 'vimwiki/vimwiki' " Personal Wiki
Plug 'janko-m/vim-test'
Plug 'nelstrom/vim-visual-star-search' " Allow * or # search for visual selected text
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth' " automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug '907th/vim-auto-save' "Autosave
Plug 'rstacruz/vim-closer' " Autoclose brackets
Plug 'justinmk/vim-sneak' " similar to EasyMotion, but more minimal
" Plug 'alok/notational-fzf-vim'
Plug 'harrydt/notational-fzf-vim', {'branch': 'enhancement/Only_show_results_for_files_of_default_or_specified_type'}
Plug 'haya14busa/is.vim' " clear search highlight after cursor moved
Plug 'psliwka/vim-smoothie' " smooth scrolling
"" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify' " Show Git changes on left side
"" IDE plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf' " Use FZF instead of coc.nvim built-in fuzzy finder
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
"" Colorscheme
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'joshdick/onedark.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Misc
Plug 'ianding1/leetcode.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Vim Setup
"*****************************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set hidden

"" Enable mouse (for window resizing)
set mouse=a

"" Fix backspace indent
set backspace=indent,eol,start

"" Map leader to Space
let mapleader="\<Space>"

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show (partial) command in status line.
set showcmd

set autoindent
"
" More natural split opening
set splitbelow
set splitright
set noequalalways

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Live substitute (neovim)
set inccommand=split

set foldlevelstart=20

"" From vim-sensible
set smarttab
set nrformats-=octal
set wildmenu
set autoread
if &history < 1000
  set history=1000
endif

syntax enable
set ruler
set number " Show current line number
set cursorline " Highlight current line
set showmatch " Show matching part of bracket pairs [] () {}

let g:nvcode_termcolors=256
if !exists('g:not_finish_vimplug')
  colorscheme onedark
endif

set termguicolors  " Enables 24-bit RGB color in the TUI. Seems to change the background color
hi LineNr ctermbg=NONE guibg=NONE

"" Status bar
set laststatus=2

"" Persistent undo
set undodir=~/.vim/undodir
set undofile

"" Enable cursor mode shapes
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

"" Disable displaying --INSERT--
set noshowmode


"*****************************************************************************
"" Key Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

"" Tabs
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

"" Open things
" Terminal in a horizontal split below current buffer
nnoremap <Leader>ot ::below 10sp term://$SHELL<cr>i

"" Mapping <Esc> to exit terminal-mode
"" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>

"" Switch windows in terminal-mode
"tnoremap <C-h> <c-\><c-n><c-w>h
"tnoremap <C-j> <C-\><C-n><C-w>j
"tnoremap <C-k> <C-\><C-n><C-w>k
"tnoremap <C-l> <C-\><C-n><C-w>l

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block up/down
" TODO conflicting keymapping with coc.nvim
" Need to figure out alternative
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

"" Commonly used commands
nnoremap <C-s> :update<CR>
inoremap <C-s> <C-O>:update<cr>
nnoremap <Leader>Q :bd<CR>
nnoremap <Leader>q :q<CR>

"" NERDTree configuration
noremap <silent> <F3> :NvimTreeToggle<CR>

"" Tagbar
nmap <silent> <F4> :Vista!!<CR>

"" fzf.vim mappings
nnoremap <silent> <C-p> :Files <CR>
nnoremap <silent> <Leader>ff :Rg <CR>
nnoremap <silent> <Leader>fb :Buffers <CR>
nnoremap <silent> <Leader>fl :Lines <CR>

"" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"" vimwiki
nmap <Leader>wp :NV<CR>

"" vim-fugitive
nmap <Leader>ga :Git add .<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gs :Git<CR> " This is the successor to the old :Gstatus
"*****************************************************************************
"" coc.nvim
"*****************************************************************************
" Better display for messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" TODO BUG
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NEED TO TEST
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"" END NEED TO TEST

"" Run formatter
nmap <Leader>rf :Format<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


"*****************************************************************************
"" Plugin Configurations
"*****************************************************************************
"" vim-airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" Goyo line number display
let g:goyo_linenr = 1


"" Tagbar
let g:tagbar_autofocus = 1

"" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup

"" Fzf
if executable('rg')
  "" Set default grep to ripgrep
  set grepprg=rg\ --vimgrep
  "# --files: List files that would be searched but do not search
  "# --no-ignore: Do not respect .gitignore, etc...
  "# --hidden: Search hidden files and folders
  let $FZF_DEFAULT_COMMAND ='rg --files --no-ignore-vcs --hidden -g "!{node_modules,.git,undodir,swap}"'
endif
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

"" vimwiki
let g:vimwiki_folding='expr'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_autowriteall = 1
"" Auto convert index.md to HTML for easier view on mobile
" autocmd BufWritePost /home/harrydt/vimwiki/index.md silent! !pandoc -o /home/harrydt/Dropbox/vimwiki/index.html /home/harrydt/vimwiki/index.md

"" vim-sneak
let g:sneak#label = 1

" Default path for NV to search
let g:nv_search_paths = ['~/vimwiki']

" Settings for leetcode.vim
let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'python3'

" vim-startfiy
let g:startify_change_to_dir = 0

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
