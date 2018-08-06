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

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'blueyed/vim-diminactive'
Plug 'sbdchd/neoformat'
Plug 'itchyny/calendar.vim'
Plug 'Yggdroot/indentLine'

"" Colorscheme
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

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

"" Disable folding
set nofoldenable 

"" Wrap line for markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set number " Show current line number
set relativenumber " Show relative line numbers
set cursorline " Highlight current line
set showmatch " Show matching part of bracket pairs [] () {}

"" gruvbox dark colorscheme
set background=dark
if !exists('g:not_finish_vimplug')
  colorscheme gruvbox
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" vim-airline visual settings
let g:airline_theme = 'gruvbox'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1

"" ale signs for errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

"" Goyo line number display
let g:goyo_linenr = 1

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Clear search highlight
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Mapping <Esc> to exit terminal-mode
"" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>

"" Switch windows in terminal-mode
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" NERDTree configuration
noremap <silent> <F3> : NERDTreeToggle<CR>

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>

"" fzf.vim
nnoremap <silent> <C-p> :Files <CR>
nnoremap <silent> <Leader>f :Find <CR>
nnoremap <silent> <Leader>b :Buffers <CR>


"*****************************************************************************
"" Custom configs
"*****************************************************************************
"" Enable deoplete
let g:deoplete#enable_at_startup = 1

"" Tagbar
let g:tagbar_autofocus = 1

"" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

"" ripgrep
if executable('rg')
  "" Set default grep to ripgrep
  set grepprg=rg\ --vimgrep

  "" Set default ripgrep configs for fzf
  "# --files: List files that would be searched but do not search
  "# --no-ignore: Do not respect .gitignore, etc...
  "# --hidden: Search hidden files and folders
  "# --follow: Follow symlinks
  "# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  let $FZF_DEFAULT_COMMAND ='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  
  "" Define custom :Find command to leverage rg
  " --column: Show column number
  " --line-number: Show line number
  " --no-heading: Do not show file headings in results
  " --fixed-strings: Search term as a literal string
  " --ignore-case: Case insensitive search
  " --no-ignore: Do not respect .gitignore, etc...
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  " --color: Search color options
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0) 
endif

"" vimwiki
"" This allows the folding to work for markdown
let g:vimwiki_folding='expr' 
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
