let g:python3_host_prog = 'C:\Python38\python.exe'
let g:python_host_prog = 'C:\Python27\python.exe'

set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after
let &packpath=&runtimepath
source $HOME/.vimrc