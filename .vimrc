" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'rip-rip/clang_complete'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'jiangmiao/auto-pairs'

" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on

" Indentation
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

" Show line numbers
set number

" Toggle invisible characters
"set list
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
"set showbreak=↪

" Key mapping for nerdtree
map <C-n> :NERDTreeToggle<CR>


" Theme
set background=dark
syntax on
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
colorscheme monokai

"let g:ycm_confirm_extra_conf = 0

" Airline Setup {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '>'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" " }}}
