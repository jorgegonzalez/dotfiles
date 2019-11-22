" Jorge's init.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

call plug#begin()
Plug 'connorholyday/vim-snazzy'
Plug 'tpope/vim-sensible'
call plug#end()

" be iMproved, required
set nocompatible
filetype off

" Enable line numbers
set number
" Enable syntax highlighting
syntax enable
" Highlight current line
"set cursorline

" Enable backspace
set backspace=indent,eol,start
" No line wrapping
set nowrap
" Change lines with left/right cursor-moving keys
set whichwrap+=<,>,h,l,[,]

" Insert spaces intead of tabs
set expandtab
set smarttab

" Tab = 2 spaces
set shiftwidth=2
set tabstop=2

" Auto indent
set autoindent
" Smart indent
set si

" Don't reset cursor to start of line when moving around
set nostartofline

set noswapfile

" Auto change dir to file directory
set autochdir

set background=dark

let $NVIM_TUI_ENABLE_TRUE_COLOR = 0

if has("termguicolors")
  set termguicolors
endif

" Skyrim belongs to the nords
" colorscheme nord

"zsh syntax for zsh-theme files
autocmd BufNewFile,BufRead *.zsh-theme   set syntax=zsh

" start at same line
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

colorscheme snazzy

set clipboard=unnamed

