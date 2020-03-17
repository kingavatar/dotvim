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
 "Plug 'tpope/vim-fugitive' " plugin from http://vim-scripts.org/vim/scripts.html
 Plug 'mhinz/vim-startify'  " The fancy start screen for Vim.
 Plug 'mhinz/vim-signify'   " Show a diff using Vim its sign column
 Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air.
 Plug 'vim-airline/vim-airline-themes'
 Plug 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting.
 Plug 'kien/rainbow_parentheses.vim' " Better Rainbow Parentheses.
 Plug 'tpope/vim-surround'  " surround.vim: quoting/parenthesizing made simple.
 Plug 'jiangmiao/auto-pairs'
 "Plug 'dense-analysis/ale'
 "Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " A code-completion engine for Vim.
 "Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'smancill/conky-syntax.vim', {'for': 'conkyrc'}
 Plug 'xuhdev/vim-latex-live-preview' , {'for' : 'tex'}
 "Plug 'majutsushi/tagbar'
 "Plug 'xolox/vim-easytags'	" A Vim plugin that manages your tag files.
 Plug 'Shougo/vimproc.vim',{'do': 'make'}
 Plug 'shougo/vimshell.vim'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : ['c','cpp'] }

 Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
 Plug 'jschmold/sweet-dark.vim'
 Plug 'arcticicestudio/nord-vim'
 Plug 'flrnd/candid.vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'yuezk/vim-js' , { 'for' : 'javascript' }
 Plug 'ap/vim-css-color'
 Plug 'maxmellon/vim-jsx-pretty' , { 'for' : ['javascriptreact','jsx'] }
 Plug 'elzr/vim-json' , {'for' : 'json'}
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
 "Plug 'prettier/vim-prettier', {
  "\ 'do': 'yarn install',
  "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

 " On-demand loading
 Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"if has('nvim')
  "Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/defx.nvim'
"endif
  "Plug 'kristijanhusak/defx-icons'
  "Plug 'kristijanhusak/defx-git'
 Plug 'mbbill/undotree' , { 'on': 'UndotreeToggle' }
 Plug 'liuchengxu/vista.vim'
 Plug 'neoclide/coc.nvim', {
			 \'branch': 'release',
			  \'do': { -> coc#util#install()}}
			 "\'do':[
			 "\':CocInstall coc-json'
			 "\,':CocInstall coc-github'
			 "\,':CocInstall coc-git'
			 "\,':CocInstall coc-vetur'
			 "\,':CocInstall coc-java'
			 "\,':CocInstall coc-python'
			 "\,':CocInstall coc-highlight'
			 "\,':CocInstall coc-ultisnips'
			 "\,':CocInstall coc-python'
			 "\,':CocInstall coc-texlab'
			 "\,':CocInstall coc-snippets'
			 "\,':CocInstall coc-explorer'
			 "\,':CocInstall coc-tsserver'
			 "\,':CocInstall coc-html'
			 "\,':CocInstall coc-css'
			 "\,':CocInstall coc-tslint'
			 "\,':CocInstall coc-eslint'
			 "\,':CocInstall coc-emoji'
			 "\]}

"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
  "Plug 'Shougo/deoplete-clangx'
  "Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
  "Plug 'deoplete-plugins/deoplete-jedi'
  "Plug 'copy/deoplete-ocaml'
  call plug#end()

command! PU PlugUpdate | PlugUpgrade
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
"             YCM                   "
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
