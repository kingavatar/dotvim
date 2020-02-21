set nocompatible

filetype on                  " off required

let mapleader = ','

runtime plugins.vim
runtime general.vim
runtime keys.vim
runtime funcs.vim

" Plugins that are neater in their own file
for f in split(glob('~/.vim/configs/*.vim'), '\n')
    exe 'source' f
endfor

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
