" Basic Settings-------------------------------
syntax on
color Dracula
let mapleader = ','
" Cursor Shape
if &term =~ "screen"
  let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
  let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm"
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif
set foldenable

" Encoding
set encoding=utf-8
scriptencoding utf-8

" Backspace
set bs=indent,eol,start

" Auto Indent
set autoindent

" Smart Indent
set smartindent

" Don't make backup file
set nobackup

" Don't make swap file
set noswapfile

" Keep 100 History
set history=100

" Show cursor info
set ruler

" Use hex
set display=uhex

" Keep 15 lines from cursor
set scrolloff=26

" Virtual Edit
set virtualedit=block

" Check if file has been changed from outside
set autoread

" No welcome message
set shortmess+=I

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

" Search
set ignorecase
set wrapscan
set hlsearch

" Number
set numberwidth=2
set nowrap

" Yaml
autocmd FileType yaml setlocal expandtab ts=2 sw=2 fenc=utf-8

autocmd InsertLeave * setlocal nocursorline
autocmd InsertEnter * setlocal cursorline
autocmd InsertLeave * highlight StatusLine ctermfg=145 guifg=#c2bfa5
autocmd InsertEnter * highlight StatusLine ctermfg=12  guifg=#1E90FF
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Window management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" FileTypes
augroup file_type
  autocmd!
  autocmd BufNewFile,BufRead Gemfile   setlocal filetype=ruby
  autocmd BufNewFile,BufRead Guardfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Brewfile  setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.md      setlocal filetype=markdown
augroup END

" Code Folding
autocmd FileType ruby   setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
nnoremap <space> za

" Relative Number
set nonumber
set relativenumber

" ClipBoard
set clipboard=unnamed

" Show title
set title

" Maps
nmap - dd
nmap t viw

nmap <Leader>y 0v$y
nmap <Leader>p o<ESC>p
nmap <Leader>d 0v$d

nmap <Leader><Leader> :w<CR>
nmap <Leader><Leader><Leader> :q!<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

nnoremap <leader>sv :source $MYVIMRC<CR>

nmap H 0
nmap L $
nmap J <C-D>
nmap K <C-U>
nmap , :

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/yuhoshino/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/yuhoshino/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins--------------------------------------
" Snippets-------------------------------------
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neocomplete'
source $HOME/dotfiles/.vimrc.neo

" Visual---------------------------------------
NeoBundle 'itchyny/lightline.vim'
source $HOME/dotfiles/.vimrc.lightline

" File Search----------------------------------
NeoBundle 'scrooloose/nerdtree'
source $HOME/dotfiles/.vimrc.nerdtree

NeoBundle 'rking/ag.vim'
let g:agprg = 'ag --nocolor --nogroup --column'

NeoBundle 'Shougo/unite.vim'
source $HOME/dotfiles/.vimrc.unite

NeoBundle 'ctrlpvim/ctrlp.vim'
source $HOME/dotfiles/.vimrc.ctrlp

NeoBundle 'majutsushi/tagbar'
source $HOME/dotfiles/.vimrc.tagbar

NeoBundle 'szw/vim-tags'
source $HOME/dotfiles/.vimrc.tags

NeoBundle 'alpaca-tc/alpaca_tags', {
    \ 'depends'  : ['Shougo/vimproc.vim',  'Shougo/unite.vim'],
    \ 'autoload' : {
    \   'commands'      : ['AlpacaTags',  'AlpacaTagsUpdate',  'AlpacaTagsSet',  'AlpacaTagsBundle',  'AlpacaTagsCleanCache'],
    \   'unite_sources' : ['tags']
    \ }
    \ }
source $HOME/dotfiles/.vimrc.alpacatags

" Git------------------------------------------
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'sjl/gundo.vim'
source $HOME/dotfiles/.vimrc.gundo

NeoBundle 'airblade/vim-gitgutter'
source $HOME/dotfiles/.vimrc.gitgutter

NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
source $HOME/dotfiles/.vimrc.gist

NeoBundle 'gregsexton/gitv'

" Editing-------------------------------------
" NeoBundle 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

NeoBundle 'scrooloose/syntastic'
source $HOME/dotfiles/.vimrc.syntastic

NeoBundle 'junegunn/vim-easy-align'
source $HOME/dotfiles/.vimrc.easyalign

NeoBundle 'terryma/vim-multiple-cursors'
source $HOME/dotfiles/.vimrc.multiplecursor

NeoBundle 'ntpeters/vim-better-whitespace'
autocmd BufWritePre <buffer> StripWhitespace

NeoBundle 'scrooloose/nerdcommenter'
source $HOME/dotfiles/.vimrc.nerdcommenter

NeoBundle 'vim-scripts/vim-auto-save'
source $HOME/dotfiles/.vimrc.autosave

NeoBundle 'Raimondi/delimitMate'

NeoBundle 'AndrewRadev/switch.vim'
source $HOME/dotfiles/.vimrc.switch

NeoBundle 'vim-scripts/surround.vim'
source $HOME/dotfiles/.vimrc.surround

" Plugin Support-------------------------------
NeoBundle 'Shougo/vimproc.vim', {
       \ 'build' : {
       \     'mac' : 'make -f make_mac.mak',
       \     'unix': 'make -f make_unix.mak'
       \    }
       \ }

NeoBundle 'thinca/vim-quickrun'
source $HOME/dotfiles/.vimrc.quickrun

NeoBundle 'vim-scripts/AnsiEsc.vim'

" VimShell-------------------------------------
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Ruby-----------------------------------------
NeoBundle 'tpope/vim-endwise'

NeoBundle 'thinca/vim-ref'
source $HOME/dotfiles/.vimrc.ref

NeoBundle 'yuku-t/vim-ref-ri'

NeoBundle 'glidenote/rspec-result-syntax'

NeoBundle 'osyo-manga/vim-monster'
source $HOME/dotfiles/.vimrc.monster

NeoBundle 't9md/vim-ruby-xmpfilter'
source $HOME/dotfiles/.vimrc.rubyxmpfilter

NeoBundle 'Keithbsmiley/rspec.vim'
source $HOME/dotfiles/.vimrc.rspec

NeoBundleLazy 'thoughtbot/vim-rspec', {
      \ 'depends'  : 'tpope/vim-dispatch',
      \ 'autoload' : { 'filetypes' : ['ruby'] }
      \ }
source $HOME/dotfiles/.vimrc.vimrspec

NeoBundle 'tpope/vim-bundler'

NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'tpope/vim-rails'

NeoBundle 'tpope/vim-rake'


NeoBundleLazy 'marcus/rsense', {
      \ 'autoload': { 'filetypes': ['ruby'] }
      \ }
source $HOME/dotfiles/.vimrc.rsense

NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
      \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
      \ 'autoload': { 'filetypes': ['ruby'] }
      \ }

" Python---------------------------------------
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": [ "python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}

NeoBundleLazy 'lambdalisue/vim-pyenv', {
      \ 'depends': ['davidhalter/jedi-vim'],
      \ 'autoload': {
      \   'filetypes': [ 'python', 'python3'],
      \ }}

NeoBundleLazy "nvie/vim-flake8", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

" End Plugins----------------------------------

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
