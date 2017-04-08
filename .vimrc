" Automatically install plugins with vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Nova Colorscheme
Plug 'zanglg/nova.vim'

" ctrl-p for fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" nice status bar
Plug 'vim-airline/vim-airline'

" automatch syntax
Plug 'tmhedberg/matchit'

" Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

" Set YCM config path for C language class completion
" Just change '~' to the path to your YCM config file
let g:ycm_global_ycm_extra_conf = '~'

set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting

" Color Scheme Setup
set termguicolors
colorscheme industry       " set a colorscheme
set background=dark

filetype indent on      " activates indenting for files

set number              " line numbers
set nobackup            " get rid of anoying ~file
set scrolloff=999   	" keep cursor in the middle of the screen while scrolling up and down.
set wildmenu 		    " show auto complete menus.
set wildmode=list:longest   " Make wildmenu behave like bash completion. Finding commands are so easy now.
set nocompatible      	" do not make vim compatible with vi.
set incsearch		    " Incremental searching
set hlsearch		    " Highlight things that we find with the search
set showcmd		        " This shows what you are typing as a command.
set mouse-=a	            " Enable mouse support in console
set wrap                "Wrap lines
set history=700
set showmatch
set noerrorbells
set novisualbell
set ai
set si
set visualbell

" Linebreak on 500 characters
set lbr
set tw=500

" 1 tab == 3 spaces
set tabstop=3
set shiftwidth=3
set expandtab
set softtabstop=3
set smarttab autoindent

" Show status bar
set laststatus=2

" Copy to Windows clipboard
set clipboard=unnamed

" Remember info about open buffers on close
set viminfo^=%

" Set highlight color
hi Search guibg=LightGreen

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif  " Remove any trailing whitespace that is in the file

" standard movement mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" No shift needed to input ':'
noremap ; :
noremap : ;

" ------------ NERDTree ------------
" Toggle NERDTree with ctrl+n
inoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" ------------ NERDTree ------------

" ------------ CtrlP -----------
" Toggle CtrlP
let g:ctrlp_map = '<c-p>'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" ------------ CtrlP -----------

" The wish that grants more wishes: edit vimrc with \ev
noremap <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

compiler gcc
