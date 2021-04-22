" ===[ TRAVIS'S CUSTOM VIMRC ]===

set nocompatible                                                                                                    " disregard vi compatibility because reasons
set showcmd		                                                                                                    " show (partial) command in status line.
set showmatch		                                                                                                " show matching brackets.
set smartcase		                                                                                                " do case insensitive matching on lowercase queries
set incsearch		                                                                                                " incremental search
set mouse=a		                                                                                                    " enable mouse usage (all modes)
set number                                                                                                          " enable line numbers
set numberwidth=5                                                                                                   " set width of the number bar
set autoindent                                                                                                      " keep indentation
set expandtab                                                                                                       " use spaces instead of tabs
set tabstop=4                                                                                                       " set tabs to 4 spaces
set shiftwidth=4                                                                                                    " indentations are 4 spaces
set hlsearch                                                                                                        " highlight search results
set ruler                                                                                                           " always show the cursor location in the statusbar
set wildmenu                                                                                                        " show popup menu for function completion
set cursorline                                                                                                      " highlight the cursor's current line
set title                                                                                                           " set filename as the terminal title
set confirm                                                                                                         " add confirmation dialogue when exiting and changes aren't saved
set encoding=utf-8                                                                                                  " set utf-8 encoding
set backspace=indent,eol,start
set splitbelow                                                                                                      " window splits are below the current window
set conceallevel=3
" set colorcolumn=80                                                                                                  " 80 character column for measuring line lengths
" set spell                                                                                                           " spell checking
" set clipboard=unnamedplus 																						  " use system clipboard

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
		\| PlugInstall --sync | source $MYVIMRC
	\| endif

" Put plugins below
call plug#begin('~/.vim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'                                                                                         " syntax highlighting for multiple languages
Plug 'chivalry/filemaker.vim'                                                                                       " FileMaker syntax highlighting

" Look and Feel
Plug 'itchyny/lightline.vim'                                                                                        " lightweight statusbar replacement
Plug 'bling/vim-bufferline'                                                                                         " show open buffers in the statusline 
Plug 'majutsushi/tagbar'                                                                                            " get overall view of the file structure (requires Exuberant Ctags)
Plug 'Yggdroot/indentLine'                                                                                          " visual line indentation reference
Plug 'scrooloose/nerdtree'                                                                                          " left-aligned file viewer
Plug 'scrooloose/nerdtree-project-plugin'                                                                           " project support for NERDTree
Plug 'PhilRunninger/nerdtree-buffer-ops'                                                                            " buffer options for NERDTree
Plug 'PhilRunninger/nerdtree-visual-selection'                                                                      " visual selector for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'                                                                                  " NERDTree GitHub support
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 																		" fancy colors for NERDTree
Plug 'ryanoasis/vim-devicons'                                                                                       " view devIcons in NERDTree

" Extended Functionality
Plug 'jiangmiao/auto-pairs'                                                                                         " automatic bracket pairing
Plug 'moll/vim-bbye'                                                                                                " close buffers without exiting VIM
Plug 'mattn/emmet-vim'                                                                                              " autocomplete for HTML and more
Plug 'airblade/vim-gitgutter'                                                                                       " show modifications to git controlled files
Plug 'dyng/ctrlsf.vim'                                                                                              " file searching tool (requires ack)
Plug 'tpope/vim-fugitive' 																							" git version control helper
Plug 'junegunn/fzf', {'do': {-> fzf#install()}} 																	" fuzzy searching (installs latest binary)
Plug 'junegunn/fzf.vim' 																							" fuzzy searching
Plug 'ludovicchabant/vim-gutentags' 																				" automatic tag management
Plug 'skywind3000/gutentags_plus' 																					" automatic tag management
Plug 'tpope/vim-commentary' 																						" comment stuff out 
Plug 'wincent/ferret' 																								" multi-file search

" PHP Specific Plugins
Plug 'StanAngeloff/php.vim' 																						" better PHP syntax highlighting
Plug 'stephpy/vim-php-cs-fixer' 																					" make your PHP code prettier
Plug 'ncm2/ncm2' 																									" -
Plug 'phpactor/phpactor' 																							" |: PHP auto-completion
Plug 'phpactor/ncm2-phpactor' 																						" -
Plug 'neomake/neomake' 																								" alert you of mistakes and coding errors

" Misc
Plug 'mhinz/vim-startify' 																							" fancy startup screen
Plug 'https://github.com/yoshi1123/vim-mtg'                                                                         " MTG builder
Plug 'jacoborus/tender.vim' 																						" tender colorscheme

call plug#end()

" ===[ COLORSCHEME CONFIGURATION ]===
colorscheme tender
" set background=dark
" set background=light

" ===[ NERDTree CONFIGURATION ]===
nnoremap <C-p> :wincmd p<CR>
nnoremap <c-t> :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree | wincmd p                                                                              " Auto-Start NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif                                                                                                  " Close NERDTree if the tree is the last remaining buffer
autocmd BufWinEnter * silent NERDTreeMirror                                                                         " Show NERDTree in new tabs automatically

" ===[ LIGHTLINE CONFIGURATION ]===
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'tender',
    \ }

" ===[ TAGBAR CONFIGURATION ]===
nmap <F8> :TagbarToggle<CR>

" ===[ INDENTLINE CONFIGURATION ]===
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] 																	" set indentation characters
let g:indentLine_enable = 0 																						" disable by default
