call plug#begin('~/.vim/plugged')

Plug 'Align'
Plug 'SirVer/ultisnips'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang', { 'for': 'go' }
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'jlanzarotta/bufexplorer'
Plug 'jtdowney/vim-som'
Plug 'jtdowney/vimux-cargo'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'ledger/vim-ledger'
Plug 'markcornick/vim-terraform'
Plug 'nanotech/jellybeans.vim'
Plug 'pangloss/vim-javascript'
Plug 'paredit.vim'
Plug 'pgr0ss/vimux-ruby-test', { 'for': 'ruby' }
Plug 'rainbow_parentheses.vim', { 'for': ['clojure', 'scheme'] }
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tComment'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'wting/rust.vim'

call plug#end()

syntax on
filetype plugin indent on

set encoding=utf8
set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set directory=/tmp//
set ruler
set wrap
set scrolloff=5
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.class,*.rbc
set nofoldenable

autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd FileType tex setlocal spell spelllang=en_us

if &t_Co == 256
  colorscheme jellybeans
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Filetype go setlocal textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab

function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=white

if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone

function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ctrlp_match_window = 'top,order:ttb,max:15'
let g:NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.rbc']
let g:VimuxHeight = '30'
let g:VimuxOrientation = 'h'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <leader>ff :CtrlP<CR>
map <silent> <leader>fr :CtrlPClearCache<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>bd :bufdo :bd<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>
map <silent> <LocalLeader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>ri :wa<CR> :VimuxInspectRunner<CR>
map <silent> <LocalLeader>rx :wa<CR> :VimuxClosePanes<CR>
map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>

imap <C-L> <SPACE>=><SPACE>

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$
