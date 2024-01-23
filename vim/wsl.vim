set t_u7=^[[6n]]

colorscheme darcula

if has('linux')
  set guioptions+=P
endif

if &term == "xterm-256color"
  set t_Co=256
  set termguicolors
elseif &term == "win32"
  set t_Co=256
  " set termguicolors
  hi Normal ctermbg=black
  set guifont=Jetbrains_Mono:h11
endif

if has("gui_running") " gvim
  set guifont=Consolas:h11
  " set guifont=Jetbrains_Mono:h11
endif

" vim: set ts=2 sts=2 sw=2 et :
