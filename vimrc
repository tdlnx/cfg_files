" [ Travis's Custom .vimrc ]

" [ Base ]
set nocompatible
set showcmd
set showmatch
set smartcase
set incsearch
set number
set relativenumber
set numberwidth=5
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set ruler
set wildmenu
set cursorline
set title
set confirm
set encoding=UTF-8
set backspace=indent,eol,start
set splitbelow
set conceallevel=3
set laststatus=2

" [ Plug Configuration ]
" -> Install Vim Plug if it's missing
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" -> Run PlugInstall automatically if plugins have changed
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
        \| endif

" [ Installed Plugins ]
call plug#begin('~/.vim/plugged')

" { Syntax Highlighting }
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'chivalry/filemaker.vim'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'

" { Code Snippets/Completion }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'

" { General Quality of Life Improvements }
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tyru/open-browser.vim'
Plug 'w0rp/ale'
Plug 'christoomey/vim-system-copy'

" { Look and Feel }
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'jacoborus/tender.vim'
Plug 'mhinz/vim-startify'

" { NERDTree Specific }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" { Writing  }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" { Extra }
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

call plug#end()

" [[ Plugin Descriptions ]] -> For more info just google it
" ------------------------------------------------------------------------.
" -> vim-polyglot    | Syntax highlighting for a bunch of languages       |
" -> vim-vue         | Syntax highlighting for Vue.js                     |
" -> filemaker       | Syntax highlighting for FileMaker                  |
" -> vim-javascript  | Better JavaScript syntax highlighting              |
" -> vim-css-color   | Highlight CSS colors in .css files                 |
" -> auto-pairs      | Auto add closing brackets/quotes/etc               |
" -> emmet-vim       | Emmet HTML/CSS snippets                            |
" -> indentLine      | Visualize line indentation                         |
" -> vim-bbye        | Close a buffer without closing Vim                 |
" -> fzf             | Fuzzy file searching                               |
" -> ack             | Ack search recursively in the current directory    |
" -> vim-gutentags   | Automatically handle ctags                         |
" -> gitentags_plus  | Enhanced ctag handling for vim-gutentags           |
" -> tagbar          | Toggle panel showing all tags in current file      |
" -> vim-commentary  | Easily comment out blocks of code                  |
" -> vim-gitgutter   | Visualize changes in Git monitored directories     |
" -> lightline       | Lightweight statusbar replacement                  |
" -> vim-bufferline  | Show open buffers beneath the statusbar            |
" -> tender          | A nice color scheme                                |
" -> vim-startify    | Vim start page with MRU file selection             |
" -> nerdtree        | Toggle a traditional right-aligned file browser    |
" -> nerdtree-git    | Visualize changed to Git managed files in NERDTree |
" -> nerdtree-syntax | Highlight files based on type in NERDTree          |
" -> goyo            | Distraction-free writing in Vim                    |
" -> limelight       | Single paragraph highlighting when using Goyo      |
" -> vimwiki         | Personal wiki inside Vim                           |
" -> calendar        | A calendar inside Vim                              |
" -> vim-snipmate    | Code snippet manager                               |
" -> js-snippets     | Javascript specific code snippets                  |
" -> ale             | Lint plugin for Vim (used ESLint)                  |
" -> vim-system-copy | Copy text to your system clipboard                 |
" -> youcompleteme   | code auto-completion (Required addl config)        |
" ------------------------------------------------------------------------'

" [ Individual Plugin Configurations ]

" { Theme }
colorscheme tender

" { Lightline }
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'tender',
    \ }

" { Goyo/Limelight  }
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" { Snipmate }
let g:snipMate = { 'snippet_version': 1 } 
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" { Ale/ESLint  }
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

" { Vimwiki }
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki/', 'syntax': 'markdown'}]

" [ Custom Shortcuts ]
map <silent> <F8> :TagbarToggle<CR>
map <silent> <F6> :Goyo<CR>
map <silent> <F4> :Bdelete<CR> 
map <silent> <F3> :NERDTreeToggle<CR>
map <silent> <F2> :Files<CR>

" [[ END ]]
