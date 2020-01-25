REM Vundle
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim
REM Python for YouCompleteMe
REM Ruby build for Command-t
REM Copy vimrc to home directory
echo F|xcopy /S /Q /Y /F .vimrc %userprofile%\_vimrc
