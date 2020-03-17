
" Start maximized
call rpcnotify(0, 'Gui', 'WindowMaximized', 1)

if exists('g:GuiLoaded')
  exe 'Guifont! Source Code Pro:h10'
endif