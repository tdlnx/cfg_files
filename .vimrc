"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" [ Base ]
set nocompatible
set showcmd
set showmatch
set nobackup
set smartcase
set incsearch
set number
set relativenumber
set autoindent
set nowrap
set expandtab
set hlsearch
set ruler
set wildmenu
"set cursorline
"set cursorcolumn
set title
set confirm
set splitbelow
set backspace=indent,eol,start
set wildmode=list:longest
set history=1000
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set conceallevel=3
set numberwidth=5
set scrolloff=10
set laststatus=2

" [ Advanced  ]
filetype on
filetype plugin on
syntax on

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
Plug 'chivalry/filemaker.vim'

" { Code Snippets/Completion }
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" { General Quality of Life Improvements }
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'

" { Look and Feel }
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'jacoborus/tender.vim'

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
" -> vim-visual-multi| Multiple cursors a-la Sublime or VS Code           |
" -> youcompleteme   | code auto-completion (Required addl config)        |
" -> dash            | Dash documentation library shortcut                |
" ------------------------------------------------------------------------'

" [[ Coc Extensions ]] -> Install with :CocInstall [extension]
" ------------------------------------------------------------------------.
" -> coc-tsserver       | Typescript                                      |
" -> coc-tslint-plugin  | TSLint                                          |
" -> coc-snippets       | Snippets                                        |
" -> coc-highlight      | Word Highlighting                               |
" -> coc-emmet          | Emmet Snippets                                  |
" -> coc-marketplace    | Marketplace for finding more coc extensions     |
" -> coc-html           | HTML                                            |
" -> coc-json           | JSON                                            |
" -> coc-vetur          | Vetur Plugin (vscode)                           |
" -> coc-css            | CSS                                             |
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

" { Ale/ESLint  }
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

" { Vimwiki }
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki/', 'syntax': 'markdown'}]

" [ Custom Keybindings ]
"-> Navigate splits with CTRL+hjkl
nnoremap <c-h> <c-w>h 
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"-> On MacOS, disable system CRTL+arrow shortcuts first
"-> Resize splits with CTRL+arrows
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" [ Custom Shortcuts ]
map <silent> <F8> :TagbarToggle<CR>
map <silent> <F6> :Goyo<CR>
map <silent> <F4> :Bdelete<CR> 
map <silent> <F3> :NERDTreeToggle<CR>
map <silent> <F2> :Files<CR>

"[[ END ]]

