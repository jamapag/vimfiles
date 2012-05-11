" vimrc
set nocompatible

set modeline

" History and behaviour
set history=1000
set undolevels=1000
set hidden
set shortmess=atI

set mouse=a
set ttyfast
set wildmenu
set ruler
set lazyredraw

"set clipboard+=unnamed
set clipboard=unnamed

set complete+=. "current buffer
set complete+=k "dictionary
set complete+=b "other bufs
set complete+=t "tags

set completeopt+=menuone    " always show the completion menu
set completeopt+=preview    " sometimes annoying window on the top
set completeopt+=longest    " don't select the first variant by default


" Autoclose preview after menu hides
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Indentation
set autoindent
set smartindent
set cindent
set wrap

"set cpoptions+=S

set showcmd

set showmatch
set mat=5

set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set smartcase

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on gitgub
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "msanders/snipmate.vim"
Bundle "majutsushi/tagbar"
Bundle "ervandew/supertab"
Bundle "kien/ctrlp.vim"


Bundle "http://github.com/rstacruz/sparkup.git", {'rtp': 'vim/'}
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'python.vim--Vasiliev'
"Bundle 'iskammer/vim-css-color'
Bundle 'css3'

"let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
map <leader>in :IndentGuidesToggle<CR>

filetype plugin on
filetype indent on


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldcolumn=2

set autoread

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=+1
endif

"set backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp
"
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

map <leader>s :source ~/.vimrc<cr>
map <leader>e :e! ~/.vimrc<cr>

"syntax enable
syntax on

if has('gui_running')
	colorscheme wombat256mod

    set guifont=Menlo:h11
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar

	set cursorline
    " hi LineNr guibg=#000000 guifg=#ffffff

    " hi CursorLine guibg=#000000

    "hi Pmenu guibg=#333333
    "hi PmenuSel guibg=#555555 guifg=#ffffff
elseif ($TERM == 'xterm-256color')
	set t_Co=256
	colorscheme wombat256mod
else
    colorscheme slate
endif

"autocmd BufEnter * :syntax sync fromstart

set scrolloff=7

set cmdheight=2

set number
set numberwidth=6


set backspace=indent,eol,start

set ignorecase
set incsearch
set hlsearch

set magic

set noerrorbells
set novisualbell
set t_vb=

" Statusbar

set laststatus=2
set statusline=
set statusline+=%n\ 
set statusline+=%f\ 
set statusline+=%h%1*%m%r%w%0*
set statusline+=[%{strlen(&ft)?&ft:'none'},
set statusline+=%{&encoding},
set statusline+=%{&fileformat}]
set statusline+=%=
set statusline+=0x%-8B\ 
"set statusline+=%04l,%04v\ %<%P
set statusline+=%c,%l\ %P

" Special statusbar
"if has("autocmd")
    "au Filetype qf
                "\ if &buftype == "quickfix" |
                "\   setlocal statusline=%2*%-3.3n%0* |
                "\   setlocal statusline+=\ \[Messages\] |
                "\   setlocal statusline+=%=%2*\ %<%P |
                "\ endif
"endif

if has('title') && (has('gui_running') || &title)
	set titlestring=
	set titlestring+=%f\ 
	set titlestring+=%h%m%r%w
	set titlestring+=\ -\ %{v:progname}
	set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif


" Mappings

"nmap :W :w
"nmap :Q :q
"nmap :WQ :wq

map <silent> <leader><cr>  :noh<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <right> :bn<cr>
map <left> :bp<cr>
map <down> :tabNext<cr>

map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose <cr>
map <leader>tm :tabmove

map <leader>g :vimgrep //j **/*.*<left><left><left><left><left><left><left><left><left>

try
	set switchbuf=usetab
	set stal=2
catch
endtry

set nofen
set fdl=0

set expandtab

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

"make Q to something useful
noremap Q gq

"make Y to consistent with C and D
nnoremap Y y$

set shiftwidth=4
set tabstop=4

set smarttab
set lbr

" Omnicomplete
if has("gui_running")
    imap <C-Space> <C-X><C-O>
else
    inoremap <C-@> <C-X><C-O>
endif

nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>bd :Bclose<cr>

" Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

set pastetoggle=<leader>p

set formatoptions-=o

" Plugins
"autocmd VimEnter * NERDTree

let g:molokai_original = 1

if (has("autocmd"))
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

    autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd BufRead *.py nmap <F5> :!python %<CR>

    autocmd BufRead *.py set tabstop=4
    autocmd BufRead *.py set nowrap
    autocmd BufRead *.py let python_highlight_all = 1

    au BufRead,BufNewFile *.css set ft=css syntax=css3 
endif

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <leader>tb :TagbarToggle<cr>

let g:tagbar_type_objc = {
            \ 'ctagstype' : 'ObjectiveC',
            \ 'kinds' : [
                \ 'i:class interface',
                \ 'I:class implementation',
                \ 'p:Protocol',
                \ 'm:Objects method',
                \ 'c:Class method',
                \ 'v:Global variable',
                \ 'F:Object field',
                \ 'f:A function',
                \ 'p:A property',
                \ 't:A type alias',
                \ 's:A type structure',
                \ 'e:An enumeration',
                \ 'M:A preprocessor macro'
            \ ]
\}
