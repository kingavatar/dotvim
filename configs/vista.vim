"let g:vista_icon_indent = ["╰─▸", "├─▸"]
"let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
  \ 'javascript': 'coc',
  \ 'typescript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'coc',
  \ }

let g:vista#renderer#enable_icon = 1
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

