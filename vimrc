" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi
set nocompatible

" turn on syntax highlighting
syntax on

" and show line numbers
set number

" Highlight current line
set cursorline

" Show the cursor position
set ruler

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" make vim try to detect file types and load ert/lugins for them
filetype off

" reload files changed outside vim
set autoread

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" open new buffers below and to the right
set splitbelow
set splitright

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" windows like clipboard
"" yank to and paste from the clipboard without prepending "* to commands
"let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
"" map c-x and c-v to work as they do in windows, only in insert mode
"vm <c-x> "+x
"vm <c-c> "+y
"cno <c-v> <c-r>+
"exe 'ino <script> <C-V>' paste#paste_cmd['i']

"" save with ctrl+s
"nmap <c-s> :w<CR>
"imap <c-s> <Esc>:w<CR>a

" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end

" set Anomyce Powerline font as default
set guifont="Anonymice Powerline"

"" allow Tab and Shift+Tab to
"" tab  selection in visual mode
"vmap <Tab> >gv
"vmap <S-Tab> <gv

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
set ignorecase       " ignore case in when searching

" Always show status line
set laststatus=2

" Load powerline plugin
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

" Set powerline
set t_Co=256
let g:Powerline_symbols = 'fancy'

" use ESC to remove search higlight
nmap <silent> ,/ :let@/=""<CR>

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces
set tabstop=2       " Make tabs as wide as 2 spaces

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" no lines longer than 120 cols
set textwidth=120

"" use <C-Space> for Vim's keyword autocomplete
""  ...in the terminal
"inoremap <Nul> <C-n>
""  ...and in gui mode
"inoremap <C-Space> <C-n>

"" On file types...
""   .md files are markdown files
"autocmd BufNewFile,BufRead *.md setlocal ft=markdown
""   .twig files use html syntax
"autocmd BufNewFile,BufRead *.twig setlocal ft=html
""   .less files use less syntax
"autocmd BufNewFile,BufRead *.less setlocal ft=less
""   .jade files use jade syntax
"autocmd BufNewFile,BufRead *.jade setlocal ft=jade

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>

"" if windows...
"if has('win32')
    "" start maximized
    "autocmd GUIEnter * simalt ~x
    "" also use .vim instead of vimfiles, make sure to run the following command
    "" once this was copied to /Users/<user>/.vim
    ""  mklink %homepath%/.vimrc %homepath%/.vim/.vimrc
    "let &runtimepath.=',$HOME/.vim'
"endif

" select all mapping
noremap <leader>a ggVG

" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin defintion
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-surround'
" -- Web Development
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'mattn/emmet-vim'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'groenewege/vim-less'
"Plugin 'skammer/vim-css-color'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/nerdcommenter'

" end plugin definition
call vundle#end()            " required for vundle
filetype plugin indent on " required!

" start NERDTree on start-up and focus active window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"" map FuzzyFinder
"noremap <leader>b :FufBuffer<cr>
"noremap <leader>f :FufFile<cr>

"" use zencoding with <C-E>
"let g:user_emmet_leader_key = '<c-e>'

"" run JSHint when a file with .js extension is saved
"" this requires the jsHint2 plugin
"autocmd BufWritePost *.js silent :JSHint

"" set the color theme to wombat256
colorscheme solarized
" make a mark for column 80
"set colorcolumn=80
" and set the mark color to DarkSlateGray
"highlight ColorColumn ctermbg=lightgray guibg=lightgray


" ------------------------ Commands ------------------------
"command -nargs=+ Se execute 'imgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
command! Reload so $MYVIMRC

" ------------------------ Functions -----------------------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" -------------------- Plugin: CtrlP --------------------

" Don't search .gitignore'd files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Don't search outside of the local working directory
let g:ctrlp_working_path_mode = ''

