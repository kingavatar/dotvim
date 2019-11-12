set nocompatible

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

:set nowrap
syntax enable 
filetype indent on
set number
set guifont=Monospace\ 16
set ch=2
highlight cComment ctermfg=Blue guifg=Pink
colorscheme darkblue
:set autoindent
:set smartindent
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
set title
color dracula
"set noswapfile
"call plug#begin()
"	Plug 'scrooloose/nerdtree'
"	Plug 'ervandew/supertab'
"	Plug 'scrooloose/syntastic'
"	Plug 'bling/vim-airline'
"	Plug 'scrooloose/nerdcommenter'
"	Plug 'tpope/vim-surround'
"	Plug 'vim-scripts/delimitMate.vim'
"	Plug 'valloric/YouCompleteMe'
"call plug#end()
"
