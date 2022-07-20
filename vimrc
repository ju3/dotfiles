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

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'airblade/vim-gitgutter'

" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on


" Tabs indentation
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Show line numbers
set number

" Highlight search patterns
set hlsearch
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Make search pattern not case sensitive
set ic

" Highlight line limits
set colorcolumn=80

" Prevent scrolling lags
set ttyfast
set ttyscroll=3
set lazyredraw

" Toggle invisible characters
"set list
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
"set showbreak=↪
" Changed chars
"set list
"set listchars=tab:▸\ ,eol:¬

" YCM - Jump to definition
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Key mapping for nerdtree
map <C-n> :NERDTreeToggle<CR>

" Switch buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Theme
set background=dark
syntax on
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
silent! colorscheme monokai

"let g:ycm_confirm_extra_conf = 0

" Airline Setup {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '>'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Speed up gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Close current buffer with while NERDtree is open
map <C-c> :bp\|bd #<CR>

" Yank to clipboard
vnoremap <C-y> "+y

" CtrlPMixed
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" Header for c files
autocmd bufnewfile *.h so /home/johann/c_header_signature.txt
autocmd bufnewfile *.c so /home/johann/c_header_signature.txt
autocmd bufnewfile *.h exe "1," . 10 . "g/file.*/s//file " .expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/file.*/s//file " .expand("%")
" " }}}
