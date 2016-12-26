set shell=/bin/zsh\ -l      "use zshell
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'            " let Vundle manage Vundle, required
Plugin 'bling/vim-airline'               "better status bars
Plugin 'othree/html5.vim'                "html5 syntax support
Plugin 'scrooloose/syntastic'            "syntax highlighting & errors
Plugin 'scrooloose/nerdtree'             "file explorer
Plugin 'scrooloose/nerdcommenter'        "file commenting
Plugin 'kien/ctrlp.vim'                  "file search
Plugin 'danro/rename.vim'                "saves buffers when renaming file
Plugin 'ajh17/Spacegray.vim'             "theme
Plugin 'chriskempson/vim-tomorrow-theme' "theme
Plugin 'geoffharcourt/vim-matchit'       "tag  matching
"Plugin 'vim-scripts/ShowMarks' showing saved marks on the left
Plugin 'tpope/vim-surround'              "auto surround entities
Plugin 'mbbill/undotree'                 "undo history
Plugin 'jszakmeister/vim-togglecursor'   "cursor for vim in terminal
Plugin 'godlygeek/tabular'               "this lets you easily indent symbols

Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'} 

call vundle#end()            
filetype plugin indent on   

"Appearance
set background=dark
color Tomorrow-Night 
"color SpaceGray  also a favourite
set showmode
"Font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Anonymous\ Pro:h12
  else
	set guifont=Anonymous\ Pro:h12
  endif
endif

"Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
" fix line breaking
set wrap
set linebreak
set nolist

"Airline config
set laststatus=2
"let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" File Type Highlighting
au BufNewFile,BufRead *.markdown set filetype=html

set backspace=2 " make backspace work
" maps a key to file explorer
map <C-n> :NERDTreeToggle<CR> 
set pastetoggle=<F2> "allows pasting large amounts of text easier

" undo list
nnoremap <F5> :GundoToggle<CR>

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set number                      "line numbers
set completeopt=longest,menuone "Make code completion better
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.CVS\|\.git$\|\.hg$\|\.svn$\|\.yardoc\|dist\|img\|out\|tmp$|build',
  \ 'file': '\.exe$\|\.so$\|\.dat$\|\.class$\|\.png$\|\.jpg$\|\.jpeg$\|\.rpt$\|\.rpt.xml$'
  \ }
let g:ctrlp_use_caching = 1
let g:ctrlp_max_height = 40

" For vim in terminal need to explicitly configure the cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

 "error checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable folding
set foldlevelstart=1
set foldmethod=syntax
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" dont create temp files
set nobackup
set nowritebackup
set noswapfile
"ignore certain things with ctrlp
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|build\|dist'

set visualbell           " don't beep
set noerrorbells         " don't beep

map <Leader>a=        :Tabularize /=<CR>
map <Leader>a<Space>  :Tabularize /<Space><CR>
map <Leader>a:        :Tabularize /:<CR>
map <Leader>a::       :Tabularize /:\zs<CR>
map <Leader>a,        :Tabularize /,<CR>
map <Leader>a;        :Tabularize /;<CR>
map <Leader>a<Bar>    :Tabularize /<Bar><CR>
map <Leader>a[        :Tabularize /[<CR>
map <Leader>a]        :Tabularize /]<CR>

set clipboard=unnamed
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
