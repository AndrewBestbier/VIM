" ~/.vimrc
set t_Co=256                      " 256 colours or death
set nocompatible                  " Must come first because it changes other options.
syntax on                         " Enable syntax highlighting
filetype off                      " Disable filetype detection
set tags=.tags                    " Hide ctags directory
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'           "Vundle is our Plugin manager
Plugin 'airblade/vim-gitgutter'  "A Plugin that uses git to show how the line has changed in the gutter
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'danro/rename.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'jgdavey/vim-turbux'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'mattn/gist-vim'
Plugin 'moll/vim-node'
Plugin 'mtth/scratch.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'pangloss/vim-javascript'
Plugin 'qpkorr/vim-bufkill'
Plugin 'rhysd/clever-f.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-sleuth.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tristen/vim-sparkup'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wesQ3/vim-windowswap'
Plugin 'wting/rust.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath+=$GOROOT/misc/vim
set encoding=utf-8
set history=1000                  " Store a ton of history (default is 20)
set showtabline=2                 " Always show the tab line at the top
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.DS_Store
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set showmatch                     " Show matching bracets when text indicator is over them
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set scrolloff=5                   " Show 3 lines of context around the cursor.
set notitle                       " Don't Set the terminal's title
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " swap files be damned
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time
set autoread                      " autoread if saved outside vim
colorscheme Tomorrow-Night-Bright
if has("gui_running")
  " Hide the stupid toolbar taking up precious space
  set guioptions=egmrt
else
  set background=dark
end
" Toggle spell checking on and off with `<leader>s`
nnoremap <SPACE> <Nop>
let mapleader = " "
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
" Close all the buffers
map <leader>ba :1,300 bd!<cr>
map <C-n> :NERDTreeToggle<CR>
" sudo write
ca w!! w !sudo tee >/dev/null "%"
" Stupid shift key fixes
ca W w
ca Wq wq
ca WQ wq
ca wQ wq
ca Q q
ca Qa qa
" no to EX mode
nnoremap Q <Nop>
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" disable mouse
set mouse=""
" highlight current line
set cursorline
" <leader>+\ clears current search
nnoremap <silent> <leader>\ :<C-u>nohlsearch<CR><C-l>
let g:ctrlp_custom_ignore = 'Godeps\|node_modules\|DS_Store\|git|public/images'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif
let g:turbux_runner  = 'tslime'
let g:turbux_command_prefix = 'bundle exec'
let g:turbux_command_rspec  = 'ruby'
let g:turbux_command_test_unit = 'ruby'
let g:turbux_command_cucumber = 'cucumber'
let g:turbux_command_turnip = 'rspec'
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" use spacebar to center around cursor
" nmap <space> zz
" powerline config
let g:airline#extensions#tabline#enabled = 1
" https://github.com/Lokaltog/powerline-fonts
let g:airline_powerline_fonts = 1
" ; is now :
nnoremap  ; :
vnoremap  ; :
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.handlebars set filetype=html
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_cucumber_cucumber_args="--profile syntastic"
let g:jsx_ext_required = 0
