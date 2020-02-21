""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Base Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on    " required
							 " To ignore plugin indent changes, instead use:
							 "filetype plugin on
syntax enable " Turn on syntax highlighting
"syntax on " Turn on grammar detection
if !exists('g:syntax_on')
	syntax enable
endif
set laststatus=2  " Status bar configuration
set termguicolors
set background=dark
colorscheme sweet_dark
set autoread      " Set to auto read when a file is changed from the outside
"autocmd! bufwritepost .vimrc source % " vimrc file is automatically loaded after modification
"if has ('autocmd') " Remain compatible with earlier versions
 "augroup vimrc     " Source vim configuration upon save
    "autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    "autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  "augroup END
"endif " has autocmd
set hidden
set encoding=UTF-8
set mouse=a       " Enable GUI mouse behavior
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set backupcopy=yes " see :help crontab
set nobackup
set nowritebackup
set clipboard=unnamed " yank and paste with the system clipboard
set autowrite     " save before commands like : next,: make
set ttyfast       " Indicates a fast terminal connection
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " Always show line numbers
set showcmd       " Show the command being entered in the status bar
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set scrolloff=7             " Minimal number of screen lines to keep above and below the cursor.
set visualbell           " Use a visual bell, don't beep!
set cursorline              " Highlight the current line
set linebreak               " Break the line on words
set textwidth=79            " Break lines at just under 80 characters
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set ruler                " Always show current position
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string
set whichwrap+=<,>,h,l,[,]
set ai "Auto indent
set si "Smart indent
highlight Comment cterm=italic
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My command line autocomplete is case insensitive. Keep vim consistent with
" that. It's a recent feature to vim, test to make sure it's supported first.
if exists("&wildignorecase")
    set wildignorecase
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
