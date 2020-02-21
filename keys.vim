"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>    " To toggle PasteMode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking

map <leader>ss :setlocal spell!<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
map <A-Left> <C-w><
map <A-Right> <C-w>>
map <A-Up> <C-w>+
map <A-Down> <C-w>-

:map ,bt :bufdo tab split<CR>:tablast<CR>:tabclose<CR>

" Tab navigation like Firefox.
nnoremap <S-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <S-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     =>   Keyboard Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
nnoremap <leader>d :NERDTreeToggle<CR>
"nnoremap <leader>d :Defx<CR>
nnoremap <leader>r :RainbowParenthesesToggle<CR>
nnoremap <leader>m :VimShellPop<CR>
"nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>v :Vista!!<CR>
nnoremap <leader>U :UndotreeToggle<CR>
"nnoremap <leader>af :ALEFix<cr>
"nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
"nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

""""""""""""""""""""""""""""""""""""""""""""""""""""""
