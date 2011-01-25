set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

set history=100
set ffs=unix,dos,mac

if has('gui_running')
  set guioptions=a
  set guifont=Monaco:h12
  set background=dark
  color zenburn
else
  set background=light
  set t_Co=16
  set listchars=eol:$,trail:·,tab:>·
endif

set nobackup
set noswapfile
set pastetoggle=<F6>
set mouse=a

set title
set ruler
set number
set lazyredraw
set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l,[,]
set shortmess=aTs      " see :help shortmess
set noerrorbells
set novisualbell
set scrolloff=3
set sidescroll=3

set splitbelow
set splitright

set showmatch
set mat=1
set hls
set incsearch
set ignorecase
set list
set statusline=%f\ \|%{&ff}\|\ %h%m%r%w%=%-14.(%l,%c%V%)\ %P
set laststatus=2

set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap

set foldenable
set foldmethod=manual
set foldopen-=undo      " don't open folds when you undo stuff

" default colors don't work very well
"hi Search ctermfg=white ctermbg=blue
"hi Pmenu  ctermfg=white ctermbg=blue
"hi PmenuSel  ctermfg=blue ctermbg=white
"
"hi SpellBad cterm=underline ctermfg=darkred ctermbg=none
"hi SpellCap cterm=underline ctermfg=darkgreen ctermbg=none
"hi SpellLocal cterm=underline ctermfg=darkyellow ctermbg=none
"hi SpellRare cterm=underline ctermfg=darkmagenta ctermbg=none
"
"hi CursorLine cterm=underline ctermfg=red ctermbg=none
"hi Visual ctermfg=black ctermbg=gray
"
"hi Directory cterm=none ctermfg=blue
"
"hi StatusLine cterm=none ctermfg=white ctermbg=red
"hi StatusLineNC cterm=none ctermfg=black ctermbg=white
"hi VertSplit cterm=none ctermfg=black ctermbg=white
"
"hi TabLine cterm=standout ctermfg=darkgray ctermbg=white
"hi TabLineSel cterm=bold ctermfg=white ctermbg=black
"hi TabLineFill cterm=standout ctermfg=darkgray ctermbg=black
"
"hi MatchParen cterm=standout ctermfg=blue ctermbg=white
"hi Folded ctermfg=blue ctermbg=black
"
"hi ErrorMsg ctermfg=white ctermbg=red
"hi ModeMsg cterm=none
"
"hi MarkedLine ctermbg=yellow ctermfg=black

autocmd FileType ruby set foldexpr=getline(v:lnum)=~'^\\s*#'
autocmd FileType c,h,cpp,hpp set list! ts=4 sts=4 sw=4 cindent
autocmd BufRead .irbrc set ft=ruby ts=2 sts=2 sw=2
autocmd BufRead config set ft=config
autocmd BufNewFile,BufRead irb_* set ft=ruby

nmap Y y$
nmap Q <NOP>

let mapleader=','
let maplocalleader=','
nnoremap <silent> <C-L> :nohls<CR>
nnoremap <silent> <C-H> :1,$ MarkLinesOff<CR>
" make F1 a second Escape in (almost) all modes
map <F1> <Esc>
map! <F1> <Esc>

let vimclojure#NailgunClient = "/opt/local/bin/ng"
let clj_want_gorilla = 1

set wildmode=list:longest
set wildmenu

colorscheme BusyBee

" Copied from @willian vimfiles
" http://github.com/willian/vimfiles/blob/master/vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABs size
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=2
set bs=2

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Tabs for some file types
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType make set noexpandtab
autocmd FileType html set noexpandtab
autocmd FileType htmldjango set noexpandtab
autocmd FileType eruby set noexpandtab
autocmd FileType xml set noexpandtab
autocmd FileType javascript set noexpandtab

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Removing ane extra whitespaces from the ends of lines
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.pt normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.rb normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.js normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.js.erb normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.css normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.html normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.html.erb normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.yml normal m`:%s/\s\+$//e ``

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Encoding
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

autocmd User Rails if &filetype != 'ruby' | setlocal noexpandtab | endif
autocmd User Rails if &filetype == 'yaml' | setlocal sw=2 sts=2 expandtab | endif
au BufNewFile,BufRead *.less set filetype=less
