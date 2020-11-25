
" Start maximized
call rpcnotify(0, 'Gui', 'WindowMaximized', 1)

if exists('g:GuiLoaded')
  exe 'Guifont! JetBrains Mono:h12'
endif
