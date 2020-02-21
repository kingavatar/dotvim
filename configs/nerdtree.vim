autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:webdevicons_enable_nerdtree = 1
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsDefaultFolderOpenSymbol = ' '
let NERDTreeCascadeSingleChildDir=0
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = "├─▸"
let g:NERDTreeDirArrowCollapsible = "╰─▸"

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^tags$', '\.git$[[dir]]']
