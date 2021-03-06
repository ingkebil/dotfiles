" set up Vundle
set nocompatible              " be iMproved, required Vundle
filetype off                  " required Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" your plugins go here ...
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'

" Snippets are separated from ultisnips
Plugin 'SirVer/ultisnips, {'v': 'de70b1e'}
Plugin 'honza/vim-snippets'

Plugin 'ervandew/supertab'
Plugin 'vim-scripts/ZoomWin'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'robertmeta/nofrils'
Plugin 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required Vundle
filetype plugin indent on    " required Vundle

" vim-airline options
let g:airline_powerline_fonts = 1 " it's sooo biutiful!
"let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_style="google"

" ctrlp options
let g:ctrlp_map = '<c-l>'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" gundo options
nnoremap <F8> :GundoToggle<CR>
set undofile
set undolevels=100
set undodir=/home/kebil/.vim/tmp/undo/

set number
set guioptions=afgimrT
set guifont=Monospace\ 9
set incsearch
set fileformats=unix,dos,mac
set visualbell vb
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
"set t_AB=[48;5;%dm " we control the background
"set t_AF=[38;5;%dm " we control the foreground
set t_Co=256 " explicitely say it's a 256 color xterm TIP 1312
set ls=2 " Always show status line
set backup " make backup file
set bdir=/home/kebil/tmp,/tmp " where to put backup file
set directory=/home/kebil/tmp,/tmp " directory is the directory for swap file
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
"set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=n " use mouse in normal mode (so we can still use *nix c/p in insert mode)
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
"set virtualedit=all " lets the cursor roam everywhere
set showmode " show current mode
set showcmd " show partial command in statusline
set history=1000 " give me a larger past
set ignorecase " make searches case-insensitive, unless they contain upper-case letters:
set hlsearch
set smartcase
set statusline=%f\ %y[%{&encoding}]%([%R%M]%)%=%l/%L,%c%V\ %P
    " Status line detail:
    " %f        file path
    " %y        file type between braces (if defined)
    " %([%R%M]%)    read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "           shows a '!' if the file format is not the platform
    "           default
    " %{'$'[!&list]}    shows a '*' if in list mode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "           only for debug : display the current syntax item name
    " %=        right-align following items
    " #%n       buffer number
    " %l/%L,%c%V    line number, total number of lines, and column number

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,prc

syntax on
filetype indent on

" turn off the background so I can see my transparent background seeping through
hi Normal ctermbg=none
" make sure the folds are not so noticeable
"hi Folded ctermbg=black ctermfg=grey
hi Folded ctermbg=none ctermfg=grey

" the starting char for alt commands
let mapleader = ","
" let loaded_matchparen=1

" I seem to type alot of :W instead of :w
map :W :w

" easy switch buffer
map <C-N> :bn!<CR>
map <C-P> :bp!<CR>

" ,e will open in the current working directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"
"""" python options
au BufNewFile,BufRead *.py setfiletype python
"au FileType python compiler python " Use python compiler for all *.pl and *.pm files.
au FileType python set foldmethod=indent
au FileType python nmap <F5> :!python <C-R>=expand("%:p")<CR>
au FileType python set makeprg=python2\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
au FileType python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"au FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://amix.dk/vim/vimrc.html
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map auto complete of (, ", ', [
inoremap <Leader>( ()<esc>:let leavechar=")"<cr>i
inoremap <Leader>[ []<esc>:let leavechar="]"<cr>i
inoremap <Leader>{ {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <Leader>} {}<esc>:let leavechar="}"<cr>i
