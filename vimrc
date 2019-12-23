set nocompatible

filetype on                  " off required

let g:tagbar_ctags_bin= '/usr/local/bin/ctags'
"""""""""""""""""""""""""""""""""""""
"              Vim-Plug             "
"""""""""""""""""""""""""""""""""""""
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !python3 install.py --clangd-completer --cs-completer --ts-completer --java-completer
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""
"auto-install vim-plug
""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-sensible'
 Plug 'tpope/vim-fugitive' " plugin from http://vim-scripts.org/vim/scripts.html
 Plug 'mhinz/vim-startify'  " The fancy start screen for Vim.
 Plug 'mhinz/vim-signify'   " Show a diff using Vim its sign column
 Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air.
 Plug 'vim-airline/vim-airline-themes'
 Plug 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting.			
 Plug 'kien/rainbow_parentheses.vim' " Better Rainbow Parentheses.
 Plug 'tpope/vim-surround'  " surround.vim: quoting/parenthesizing made simple.
 Plug 'jiangmiao/auto-pairs'
 Plug 'scrooloose/syntastic'
 Plug 'ervandew/supertab'
 Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " A code-completion engine for Vim.
 Plug 'SirVer/ultisnips'| Plug 'honza/vim-snippets'
 Plug 'smancill/conky-syntax.vim', {'for': 'conkyrc'}
 Plug 'xuhdev/vim-latex-live-preview'
 Plug 'majutsushi/tagbar'
 Plug 'xolox/vim-misc'
 Plug 'xolox/vim-easytags'	" A Vim plugin that manages your tag files.
 Plug 'Shougo/vimproc.vim',{'do': 'make'} 
 Plug 'shougo/vimshell.vim'
 Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'octol/vim-cpp-enhanced-highlight'
 Plug 'prettier/vim-prettier'
 "Plug 'hjkl.vim'
 " On-demand loading
 Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 Plug 'mbbill/undotree' , { 'on': 'UndotreeToggle' }
call plug#end()

command! PU PlugUpdate | PlugUpgrade
filetype plugin indent on    " required
							 " To ignore plugin indent changes, instead use:                                                                                                   
							 "filetype plugin on 
syntax enable " Turn on syntax highlighting
syntax on " Turn on grammar detection 
"set termguicolors
autocmd! bufwritepost .vimrc source % " vimrc file is automatically loaded after modification
set autoread " Set to auto read when a file is changed from the outside
set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
"set list          " Make whitespace characters visible
"set listchars=tab:▸\ ,trail:• 
"set list          " Make whitespace characters visible
"set listchars=tab:▸\ ,trail:• 
set autowrite     " save before commands like : next,: make
set ttyfast       " Indicates a fast terminal connection
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
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

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype python set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>    " To toggle PasteMode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c call IoStream()
fu! IoStream()
    if line("$") == 1
        call append(0, "#include <stdio.h>")
        call append(1 ,"#include <stdlib.h>")
        call append(2,"")
        call append(3,"")
        call append(4, "int main()")
        call append(5,"{")
		call append(6,"")
		call append(7,"")
		call append(8,"")
		call append(9, "    return 0;")
        call append(10, "}")
    endif
endfu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType cpp call IoStream()
fu! IoStream()
    if line("$") == 1
        call append(0, "#include <iostream>")
        call append(1 ,"")
		call append(2,"using namespace std;")
		call append(3,"")
		call append(4, "int main()")
        call append(5,"{")
		call append(6,"")
		call append(7,"")
		call append(8,"")
		call append(9, "    return 0;")
        call append(10, "}")
    endif
endfu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
color dracula
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking

let mapleader = ','
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i 
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" => quicker window switching
""""""""""""""""""""""""""""""""""""""""""
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <C-Enter> <C-w>=
map <C-,> <C-w><
map <C-.> <C-w>>
map <C-+> <C-w>+
map <C--> <C-w>-
""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JavaScript section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#exec_cmd_path = "/usr/lib/node_modules/prettier"
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
"Running before saving async (vim 8+)
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My command line autocomplete is case insensitive. Keep vim consistent with
" that. It's a recent feature to vim, test to make sure it's supported first.
if exists("&wildignorecase")
    set wildignorecase
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""
" Use local vimrc if available {
  if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
  endif
"""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use local gvimrc if available and gui is running {
  if has('gui_running')
      if filereadable(expand("~/.gvimrc.local"))
          source ~/.gvimrc.local
      endif
  endif
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          Latex                                     
""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'evince'

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Util Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-a>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 		   vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          Rainbow Parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['black',       'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Commands
":RainbowParenthesesToggle       " Toggle it on/off
":RainbowParenthesesLoadRound    " (), the default when toggling
":RainbowParenthesesLoadSquare   " []
":RainbowParenthesesLoadBraces   " {}
":RainbowParenthesesLoadChevrons " <>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_c_checkers = ['clang_check',"gcc"]
let g:syntastic_quiet_messages = { 'regex': 'void' }
let g:syntastic_python_checkers=['flake8']
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"			vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_show_diagnostics_ui = 0
let g:easytags_file = '~/.vim/tags'
"let g:easytags_suppress_ctags_warning = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            Keyboard Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :RainbowParenthesesToggle<CR>
nnoremap <leader>m :VimShellPop<CR>
nnoremap <leader>t :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
