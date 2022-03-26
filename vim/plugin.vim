" https://github.com/junegunn/vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '$HOME/.local/share/vim/plugged')

" Plug 'doums/darcula'


" Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeDirArrows = 1
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "M",
  \ "Staged"    : "+",
  \ "Untracked" : "?",
  \ "Renamed"   : "R",
  \ "Unmerged"  : "C",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }
map <silent> <F1> :NERDTreeToggle<cr>


Plug 'kien/tabman.vim'
" let g:tabman_toggle = '<leader>mt'
" let g:tabman_focus  = '<leader>mf'
" let g:tabman_width = 25
" let g:tabman_side = 'left'
" let g:tabman_specials = 0
let g:tabman_number = 1


Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <Leader>a :Ack!<space>-i<space>


Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_max_depth = '12'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$|build',
  \ 'file': '\v\.(iml|lnk|tar.gz|zip|jar)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_abbrev = {
  \ 'gmode': 'i',
  \ 'abbrevs': [
    \ {
      \ 'pattern': '^cdnote',
      \ 'expanded': '@cd ~/note',
      \ 'mode': 'pfz',
    \ },
    \ {
      \ 'pattern': '^cdscript',
      \ 'expanded': '@cd ~/scripts',
      \ 'mode': 'pfz',
    \ },
    \ ]
  \ }
map <leader>b :CtrlPBuffer<cr>
map <leader>l :CtrlPLine<cr>


Plug 'majutsushi/tagbar'
let g:tagbar_width=35
" let g:tagbar_sort=0
map <F2> :TagbarToggle<cr>


Plug 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <s-v> <Plug>(expand_region_shrink)


Plug 'vim-scripts/Mark--Karkat'
" vmap <leader>m :Mark <c-r>=expand("<cword>")<cr><cr>
" nnoremap <leader>m :Mark <c-r>=expand("<cword>")<cr><cr>
" nnoremap <leader>n :SearchCurrentMark<cr>
hi MarkWord1    ctermbg=14      ctermfg=0
hi MarkWord2    ctermbg=10      ctermfg=0
hi MarkWord3    ctermbg=21      ctermfg=15  cterm=bold
hi MarkWord4    ctermbg=9       ctermfg=0
hi MarkWord5    ctermbg=13      ctermfg=0
hi MarkWord6    ctermbg=52      ctermfg=15  cterm=bold
hi MarkWord7    ctermbg=255     ctermfg=0
hi MarkWord8    ctermbg=196     ctermfg=15  cterm=bold
hi MarkWord9    ctermbg=12      ctermfg=15  cterm=bold
hi MarkWord10   ctermbg=154     ctermfg=0
hi MarkWord11   ctermbg=219     ctermfg=15  cterm=bold
hi MarkWord12   ctermbg=22      ctermfg=15  cterm=bold
hi MarkWord13   ctermbg=208     ctermfg=0
hi MarkWord14   ctermbg=94      ctermfg=15  cterm=bold
hi MarkWord15   ctermbg=46      ctermfg=0
hi MarkWord16   ctermbg=248     ctermfg=0
hi MarkWord17   ctermbg=1       ctermfg=15  cterm=bold
hi MarkWord18   ctermbg=70      ctermfg=15  cterm=bold
hi MarkWord19   ctermbg=153     ctermfg=0
hi MarkWord20   ctermbg=239     ctermfg=15


Plug 'junegunn/vim-easy-align'


Plug 'easymotion/vim-easymotion'
map  <leader>f <Plug>(easymotion-s)
" <leader>f{char} to move to {char}
" map <leader>f <Plug>(easymotion-bd-f)
" nmap <leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
" Move to line
" map <leader>L <Plug>(easymotion-bd-jk)
" nmap <leader>L <Plug>(easymotion-overwin-line)
" Move to word
" map  <leader>w <Plug>(easymotion-bd-w)
" nmap <leader>w <Plug>(easymotion-overwin-w)


" Plug 'bufferhint'
" Plug 'tpope/vim-surround'
" map <leader>c <Plug>csurround
Plug 'jiangmiao/auto-pairs'


Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
" modify plugin source: cal rainbow_parentheses#load(2)
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces


" Plug 'terryma/vim-multiple-cursors'
" " let g:multi_cursor_start_key='<c-n>'
" let g:multi_cursor_start_key='<c-g>'
" " let g:multi_cursor_start_word_key='g<c-n>'
" let g:multi_cursor_next_key='<c-g>'
" " let g:multi_cursor_prev_key='<c-p>'
" let g:multi_cursor_skip_key='<c-k>'
" let g:multi_cursor_exit_from_visual_mode=0
" let g:multi_cursor_exit_from_insert_mode=0
" 
" highlight multiple_cursors_cursor ctermbg=Green ctermfg=Red term=reverse gui=reverse
" highlight link multiple_cursors_visual Visual
" 
" fun! Multiple_cursors_before()
"   map <space> <nop>
"   unmap v
"   vmap V <Plug>(expand_region_expand)
"   set nocuc
" endfun
" 
" fun! Multiple_cursors_after()
"   unmap <space>
"   unmap V
"   vmap v <Plug>(expand_region_expand)
"   if mode() == 'i'
"     set cuc
"   endif
" endfun


Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_default_mappings = 0
let g:VM_leader = ' '
let g:VM_maps = {
  \ 'Find Under'          : '<c-g>',
  \ 'Find Subword Under'  : '<c-g>',
  \ 'Visual Cursors'      : '<c-g>',
  \ }


" Plug 'embear/vim-foldsearch'


Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" nmap <c-\>s :cs find s <c-r>=expand("<cword>")<cr><cr> :copen<cr><cr>
" nmap <c-\>g :cs find g <c-r>=expand("<cword>")<cr><cr>
" nmap <c-\>d :cs find d <c-r>=expand("<cword>")<cr><cr> :copen<cr><cr>
" nmap <c-\>c :cs find c <c-r>=expand("<cword>")<cr><cr> :copen<cr><cr>
" nmap <c-\>t :cs find t <c-r>=expand("<cword>")<cr><cr> :copen<cr><cr>
" nmap <c-\>e :cs find e <c-r>=expand("<cword>")<cr><cr> :copen<cr><cr>
" nmap <c-\>f :cs find f <c-r>=expand("<cfile>")<cr><cr>
" nmap <c-\>i :cs find i <c-r>=expand("<cfile>")<cr><cr> :copen<cr><cr>


Plug 'rhysd/clever-f.vim'


if has('nvim')
  Plug 'sslivkoff/vim-scroll-barnacle'
endif


" legacy plugins
" Plug 'winmanager'
" Plug 'L9'
" Plug 'ascenator/L9', {'name': 'newL9'}
" Plug 'tpope/vim-fugitive'
" Plug 'udalov/kotlin-vim'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'wincent/command-t'

" Plug 'taglist.vim'
" let Tlist_Exit_OnlyWindow=1 " close if no file
" let Tlist_GainFocus_On_ToggleOpen=1 " focus when open
" let Tlist_Use_Right_Window=1 " show on right side
" map <F2> :TlistToggle<cr>

" Plug 'fuzzyfinder'
" map <leader>b :FufBuffer<cr>
" map <leader>o :FufFile<cr>
" :FufBuffer
" :FufFile
" :FufDir
" :FufBookmarkFile
" :FufBookmarkDir
" :FufTag
" :FufJumpList
" :FufLine
" <cr>  (g:fuf_keyOpen)        - opens in a previous window.
" <c-j> (g:fuf_keyOpenSplit)   - opens in a split window.
" <c-k> (g:fuf_keyOpenVsplit)  - opens in a vertical-split window.
" <c-l> (g:fuf_keyOpenTabpage) - opens in a new tab page.
" <c-]>                        - delete bookmark.

call plug#end()

" vim: set ts=2 sts=2 sw=2 et :
