"""""""""""""""""""
" => VUNDLE SETUP 
"""""""""""""""""""
set nocompatible                          " be iMproved, required.
filetype off                              " required.

set rtp+=~/.vim/bundle/Vundle.vim         " sets Vundle location.
call vundle#begin()                       " starts check for plugins.

"""""""""""""""""""
" => PLUGINS SETUP 
"""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dense-analysis/ale'
Plugin 'vim-airline/vim-airline'

call vundle#end()                         " ends check for plugins.
filetype plugin indent on                 " required.

"""""""""""""""""""
" => VISUALS 
"""""""""""""""""""
set termguicolors                         " Better looking colors.
set background=dark                       " Dark colorscheme.
set lazyredraw                            " Speeds up macros by redrawing screen only when necessary.  
syntax enable                             " Pretty colors.
colorscheme challenger_deep               " Activates colorscheme.

set showmatch                             " Highlights matching parenthesis.
set cursorline                            " Highlights the current line.
set showcmd                               " Shows last command entered on the bottom.
set ruler                                 " Shows current line number on the bottom.
set number                                " Shows line numbers on the side.
set foldcolumn=1                          " Shows folding guides for the line.
set cmdheight=2                           " Height of the command bar.
set scrolloff=4                           " Amount of lines to keep between cursors and screen bottom.

"""""""""""""""""""
" => QOL FIXES 
"""""""""""""""""""
set termencoding=utf-8
set encoding=utf-8

" Use persistent history.
if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo_dir")
        call mkdir($HOME."/.vim/undo_dir", "", 0700)
endif
set undodir=~/.vim/undo_dir
set undofile

" Stops vim from making those annoying backups on the same folder.
set nobackup
set noswapfile

runtime macros/matchit.vim                " Pressing % on 'if' jumps to 'else'.

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

:inoremap ii <Esc>

set incsearch                             " Incremental search.
set hlsearch                              " Highlights search matches.
set ignorecase                            " Ignores case when searching...
set smartcase                             " ... Except when using UPPERCASE.

set autoread                              " Updates file when changed from outside VIM.
set autoindent                            " Automatic indenting.
set smartindent                           " Smarter indenting.
set backspace=indent,eol,start            " Proper backspace.
set hidden                                " More than one unsaved buffer.
set wildmenu                              " Command-line completion.  
set wildmode=longest:full,list:full
set splitright                            " Splits right instead of left.
set splitbelow                            " Splits below instead of above.

set tabstop=4                             " Size of TAB character when viewing a file. 
set softtabstop=4                         " Size of TAB character when inserting.
set expandtab                             " Expands TAB character into spaces.

"""""""""""""""""""
" => COMMANDS
"""""""""""""""""""
command! Py ! cls && python %

"""""""""""""""""""
" => NERDCOMMENTER 
"""""""""""""""""""
let g:NERDTrimTrailingWhitespace = 1      " Removes whitespace.
let g:NERDSpaceDelims = 1                 " Automatically spaces after comment.
let g:NERDCompactSexyComs = 1             " Sexy comps.

"""""""""""""""""""
" => NERDTREE 
"""""""""""""""""""
let NERDTreeShowHidden = 1                " Always show hidden files.
let NERDTreeMinimalUI = 1                 " Removes ? for help and bookmarks.

autocmd VimEnter * NERDTree | wincmd p    " Automatically opens NERDTree on start.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""
" => AIRLINE 
"""""""""""""""""""
set laststatus=2
set noshowmode 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
