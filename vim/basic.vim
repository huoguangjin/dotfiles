set backupdir=$HOME/.cache/vim/backup//
set directory=$HOME/.cache/vim/swap//
set undodir=$HOME/.cache/vim/undo//
set viminfo+=n$HOME/.cache/vim/viminfo
set rtp+=$HOME/.local/share/vim
let g:netrw_home='$HOME/.cache/vim'

syntax on
syntax enable

set autoread


" tab & intent & space
set expandtab " use spaces instead of tab
set tabstop=4 " 1 tab = 4 spaces
set softtabstop=2
set shiftwidth=2
set autoindent
set scrolloff=5 " keep lines between caret and bottom


" encoding
let &termencoding=&encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030


" relative line number, disable: set nonu nornu
set number
set relativenumber


" search
set showmatch " highlight matched text
set hlsearch " highlight search result
set ignorecase " case insensitive when search
set incsearch " smart match when typing on search
set t_Co=256
set shm-=S "show search count

" fold
set foldmethod=indent
set foldlevel=20
set foldcolumn=2


" ruler statusline cmd
set ruler
set rulerformat=%50(%<%f%m%r\ %{(&fenc=='utf-8')?'':'\ '.(&fenc!=''?&fenc:&enc)}%{(&bomb?'+BOM':'')}%=\ %*\%l,%v\ %p%%%)

set statusline=%1*%n\ %<%*%F%m%r\ "
set statusline+=%{(&fenc=='utf-8')?'':'\ '.(&fenc!=''?&fenc:&enc)}%{(&bomb?'+BOM':'')}
set statusline+=%=\ %L\ %*\%l,%v\ %p%%
set laststatus=1 " 1: show if at least two windows, 2: always
hi User1 ctermfg=white ctermbg=8

set showcmd

set wildmenu " cmd hint menu
set wildignore+=*.class,*.o,*.pyc,*.so,*.swp,*.zip


set completeopt=preview,menu


" enable mouse
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

set whichwrap+=h,l,<,>,[,] " allow move cross lines
set backspace=indent,eol,start


set cul " highlight cursor line
" highlight cursor column in insert mode
au InsertEnter * set cuc
au InsertLeave * set nocuc
hi CursorColumn ctermfg=white ctermbg=8

hi TabChar ctermbg=blue" gui=underline guibg=blue
match TabChar /\t/

hi WhitespaceEOL ctermbg=red gui=underline guibg=red
match WhitespaceEOL /\s\+$/

set list listchars=tab:→-,trail:·,extends:»,precedes:«,nbsp:×


if has('persistent_undo')
  set undofile
endif


" remember last caret position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


au BufNewFile *.{c,cpp,sh,py,js} exe ":call <sid>FileTemplate()"
fun! s:FileTemplate()
  if expand("%:e") == "c"
    call setline(1, "#include<stdio.h>")
  elseif expand("%:e") =="cpp"
    call setline(1, "#include<iostream>")
    call setline(2, "")
    call setline(3, "using namespace std;")
  elseif expand("%:e") == "sh"
    call setline(1, "#!/usr/bin/env bash")
    call setline(2, "set -euo pipefail")
  elseif expand("%:e") == "py"
    call setline(1, "#!/usr/bin/env python3")
  elseif expand("%:e") == "js"
    call setline(1, "#!/usr/bin/env node")
  endif
  call append(line("$"), "")
  call append(line("$"), "")
  call append(line("$"), "")

  normal Gk
  startinsert! " enter insert mode
endfun



au BufRead *.{ts} set ft=typescript


map <F5> :call <sid>BuildAndRun()<cr>
fun! s:BuildAndRun()
  exe "w"
  if &filetype == "c"
    exe "!gcc % -o %< && time ./%< && rm ./%<"
  elseif &filetype =="cpp"
    exe "!g++ % -o %< && time ./%< && rm ./%<"
  elseif &filetype == "java"
    exe "!javac % && time java %< && rm ./%<.class"
  elseif &filetype == "kotlin" " .kts
    if expand("%:e") == "kts"
      exe "!time kotlinc -script %"
    elseif expand("%:e") == "kt"
      exe "!kotlinc % -include-runtime -d %:r.jar"
      exe "!time java -jar %:r.jar"
      exe "!rm %:r.jar"
    endif
  elseif &filetype == "sh"
    exe "!time [ -x ./% ] && ./% || (chmod +x ./% && ./%)"
  elseif &filetype == "python"
    exe "!time [ -x ./% ] && ./% || (chmod +x ./% && ./%)"
  elseif &filetype == "javascript"
    exe "!time node ./%"
  elseif &filetype == "typescript"
    exe "!tsc % --outFile ./%< && time node ./%< && rm ./%<"
  elseif &filetype == "haskell"
    exe "!time ghci ./%"
  elseif &filetype == "hercules" && expand("%:e") == "rs"
    exe "!rustc % && time ./%< && rm ./%<"
  else
    echo "unknown filetype:" &filetype
  endif
endfun


fun! ClearRegister()
  let @"0 = ""
  let @"1 = ""
  let @"2 = ""
  let @"3 = ""
  let @"4 = ""
  let @"5 = ""
  let @"6 = ""
  let @"7 = ""
  let @"8 = ""
  let @"9 = ""
endfun

" vim: set ts=2 sts=2 sw=2 et :
