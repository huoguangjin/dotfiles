let mapleader="\<space>"

map ; :
map ' `
map \ `
map q: :q

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>
cmap qq q!
cmap q1 q!


nnoremap <leader>j 5<c-e>
nnoremap <leader>k 5<c-y>


" delete without saving to register
nnoremap <leader>d "_d

" copy paste
map <leader>y "*yy
vmap <leader>y "*y
map <leader>p "*p


" search
vnoremap <silent> // y/<c-r>"<cr>


" buffer & tab & window
map <leader>1 :b 1<cr>
map <leader>2 :b 2<cr>
map <leader>3 :b 3<cr>
map <leader>4 :b 4<cr>
map <leader>5 :b 5<cr>
map <leader>6 :b 6<cr>
map <leader>7 :b 7<cr>
map <leader>8 :b 8<cr>
map <leader>9 :b 9<cr>

noremap t <Space>

noremap <c-t> :tabnew  <bs>
noremap tt :tabnew  <bs>
noremap tc :tabc<cr>

noremap th gT
noremap tl gt

noremap t- 5<c-w>-
noremap t= 5<c-w>+
noremap t, 5<c-w><
noremap t. 5<c-w>>

noremap tp :bp<cr>
noremap tn :bn<cr>

noremap td :bd<cr>

noremap <silent> to :CtrlP<cr>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <Left>
imap <c-l> <Right>

map <c-tab> <c-w><c-w>

map <F10> <c-w>q
map <F11> <c-w>v
map <F12> <c-w>s


" open current file path in Finder
nnoremap <leader>o :!open %:h<cr><cr>
" open current file using default App
"nnoremap <leader>o :!open %<cr><cr>
" open current file using subl
nnoremap <leader>s :!subl %:p -a %:h<cr><cr>
" nnoremap <leader>s :w !sudo tee % <cr>


" reload vim config
noremap <silent> <buffer> <leader>r :exe $VIMINIT<cr>
" noremap <silent> <buffer> <leader>r :so $HOME/dotfiles/vim/vimrc<cr>


" togglefold
nnoremap <space>= za


map <c-'> :call ToggleScrollMode()<cr>
fun! ToggleScrollMode()
  if exists("s:scroll_mode")
    unmap k
    unmap j
    unlet s:scroll_mode
  echom "scroll mode off"
  else
    nnoremap <esc> :call ToggleScrollMode()<cr>
    nnoremap j 5<c-e>
    nnoremap k 5<c-y>
    let s:scroll_mode=1
  echom "scroll mode on"
  endif
endfun

" vim: set ts=2 sts=2 sw=2 et :
