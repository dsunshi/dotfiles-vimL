
"  _____  _             _
" |  __ \| |           (_)
" | |__) | |_   _  __ _ _ _ __  ___
" |  ___/| | | | |/ _` | | '_ \/ __|
" | |    | | |_| | (_| | | | | \__ \
" |_|    |_|\__,_|\__, |_|_| |_|___/
"                  __/ |
"                 |___/
" Plugins ----------------------{{{
" be Improved - required for Vundle to disable vi compatibility (emulation of old bugs)
set nocompatible

" required for Vundle:
filetype off

" set the runtime path to include Vundle and initialize
if has('win32')
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim
  let path='$HOME/vimfiles/bundle'
else
  set rtp+=$HOME/.vim/bundle/Vundle.vim
  let path='$HOME/.vim/bundle'
endif
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git integration
Plugin 'tpope/vim-fugitive'

" easily modify surrounding pairs
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'

" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion
Plugin 'tpope/vim-commentary'

" Custom text objects
Plugin 'kana/vim-textobj-user'
" Function arguments as text objects
Plugin 'vim-scripts/argtextobj.vim'
" snippet tool
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plugin 'honza/vim-snippets'

" Tabular for aligning text
Plugin 'godlygeek/tabular'

" allows you to use <Tab> for all your insert completion needs
Plugin 'ervandew/supertab'

" silver searcher via ack
Plugin 'mileszs/ack.vim'

" file explorer
Plugin 'wincent/command-t'

" auto-complete
Plugin 'Valloric/YouCompleteMe'

" rainbow parenthesis
Plugin 'luochen1990/rainbow'

" goyo focused editing
Plugin 'junegunn/goyo.vim'

" color theme(s)
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rakr/vim-two-firewatch'
Plugin 'AlessandroYorba/Sierra'
Plugin 'sts10/vim-pink-moon'
Plugin 'Nequo/vim-allomancer'
Plugin 'koirand/tokyo-metro.vim'
Plugin 'dennougorilla/azuki.vim'
Plugin 'fcpg/vim-farout'
Plugin 'nightsense/vim-crunchbang'
Plugin 'sainnhe/gruvbox-material'
Plugin 'arzg/vim-oldbook8'
Plugin 'axvr/photon.vim'
Plugin 'sainnhe/vim-color-forest-night'

" rust
Plugin 'rust-lang/rust.vim'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" all Plugins must be added before this line:
call vundle#end()            " required
filetype plugin indent on    " required

" try to detect filetypes (restore setting after Vundle)
filetype plugin on

" file encoding - required for YouCompleteMe
set encoding=utf-8
" }}}

"     /\
"    /  \   _ __  _ __   ___  __ _ _ __ __ _ _ __   ___ ___
"   / /\ \ | '_ \| '_ \ / _ \/ _` | '__/ _` | '_ \ / __/ _ \
"  / ____ \| |_) | |_) |  __/ (_| | | | (_| | | | | (_|  __/
" /_/    \_\ .__/| .__/ \___|\__,_|_|  \__,_|_| |_|\___\___|
"          | |   | |
"          |_|   |_|
" Appearance --------------------------------------------{{{

" set 256 colors
set t_Co=256

" set the colorscheme
set background=dark
colo sierra

" firewatch
" let g:two_firewatch_italics=1
" colo two-firewatch
"let g:airline_theme='twofirewatch'

" show the ruler on the right side of the status line
set ruler

" enable line numbers
set number

" enable relative line numbers
set relativenumber

" draw a line at column 100
set colorcolumn=100

" don't show the mode as this will be included by the status line
set noshowmode

" always show the status line
set laststatus=2

" gVim options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" font selection
if has('win32')
  set guifont=Source\ Code\ Pro:h10
else
  set guifont=Source\ Code\ Pro\ 10
endif

" enable syntax highlighting
syntax on

" highlight the current line
set cursorline

" shows matching pairs of (), [], or {}
set showmatch

" settings to display whitespace characters
set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:┈┈                 " BOX DRAWINGS LIGHT QUADRUPLE DASH HORIZONTAL' (U+2508, UTF-8: E2 94 88)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)

" vim-airline Theme
"let g:airline_theme='base16'

" automatically displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#enabled=1

" Set the directory for UltiSnips (setup by Vundle)
if has('win32')
  let g:UltiSnipsSnippetsDir = "~/vimfiles/bundle/vim-snippets/UltiSnips"
else
  let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/UltiSnips"
endif
if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif

  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif
" }}}

"  _  __              _             _
" | |/ /             | |           | |
" | ' / ___ _   _ ___| |_ _ __ ___ | | _____  ___
" |  < / _ \ | | / __| __| '__/ _ \| |/ / _ \/ __|
" | . \  __/ |_| \__ \ |_| | | (_) |   <  __/\__ \
" |_|\_\___|\__, |___/\__|_|  \___/|_|\_\___||___/
"            __/ |
"           |___/
" Keywords ------------------------------------{{{
" set the leader key
let mapleader=" "

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" pressing Ctrl-L leaves insert mode in evim, so why not in regular vim, too
" :inoremap <C-L> <Esc>

inoremap <C-D> <Esc>d0s

" pressing Ctrl-m will toggle relative numbering and the cursorline, this will prevent lag
" when editing very large files
noremap <leader>rel :set relativenumber!<CR>:set cursorline!<CR>

" Pressing F5 will delete whitespace from lines that only have whitespace (but will not delete the blank line). And
" any trailing whitespace on lines with content.
" Note: this will also save and restore the last search pattern.
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/^\s\+$//e <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Open UltiSnips edit function
nnoremap <leader>ue :UltiSnipsEdit<cr>

" toggle umlaut feature (faster German typing)
nnoremap <leader>de :call ToogleUmlauts()<CR>
nnoremap <leader>det :call ToogleTexUmlauts()<CR>
" }}}

"   ____        _   _
"  / __ \      | | (_)
" | |  | |_ __ | |_ _  ___  _ __  ___
" | |  | | '_ \| __| |/ _ \| '_ \/ __|
" | |__| | |_) | |_| | (_) | | | \__ \
"  \____/| .__/ \__|_|\___/|_| |_|___/
"        | |
"        |_|
" Options ------------------------{{{
" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"

" a tab is the width of 4 spaces
set tabstop=3

" when auto-indenting use 4 spaces (default is 8?)
set shiftwidth=3

" expand tabs into spaces
set expandtab

" Enable incremental searching
set incsearch

" Highlight all items found by searching
set hlsearch

" backspace removes all (indents, EOLs, start)
set backspace=indent,eol,start

" Disable filtering by filetype
autocmd FileType * let b:browsefilter = ''

" start scrolling 3 lines before edge of viewport
set scrolloff=3
" }}}

"  ______                _   _
" |  ____|              | | (_)
" | |__ _   _ _ __   ___| |_ _  ___  _ __  ___
" |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" | |  | |_| | | | | (__| |_| | (_) | | | \__ \
" |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
" Functions --------------------------------{{{

" function to enable faster German typing
" starting at 1 will enable the mappings the first time the function is called (disabled by default)
let g:auto_umlaut = 1

function! ToogleUmlauts()
    if g:auto_umlaut
        echo "Quick entry for umlauts (and ß) ENABLED!"
        inoremap ae ä
        inoremap oe ö
        inoremap ue ü
        inoremap ss ß
        inoremap Ae Ä
        inoremap Oe Ö
        inoremap Ue Ü
        let g:auto_umlaut = 0
    else
        echo "Quick entry for umlauts (and ß) DISABLED!"
        iunmap ae
        iunmap oe
        iunmap ue
        iunmap ss
        iunmap Ae
        iunmap Oe
        iunmap Ue
        let g:auto_umlaut = 1
    endif
endfunction

function! ToogleTexUmlauts()
    if g:auto_umlaut
        echo "Quick entry for umlauts (and ß) ENABLED!"
        inoremap ae {\\"a}
        inoremap oe {\\"o}
        inoremap ue {\\"u}
        inoremap ss {\\s}
        inoremap Ae {\\"A}
        inoremap Oe {\\"O}
        inoremap Ue {\\"U}
        let g:auto_umlaut = 0
    else
        echo "Quick entry for umlauts (and ß) DISABLED!"
        iunmap ae
        iunmap oe
        iunmap ue
        iunmap ss
        iunmap Ae
        iunmap Oe
        iunmap Ue
        let g:auto_umlaut = 1
    endif
endfunction
" }}}

"                _           _____                                          _
"     /\        | |         / ____|                                        | |
"    /  \  _   _| |_ ___   | |     ___  _ __ ___  _ __ ___   __ _ _ __   __| |___
"   / /\ \| | | | __/ _ \  | |    / _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __|
"  / ____ \ |_| | || (_) | | |___| (_) | | | | | | | | | | | (_| | | | | (_| \__ \
" /_/    \_\__,_|\__\___/   \_____\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/
"
" Auto Commands -----------------------------------------------------------{{{
"
" Stolen from Greg Hurrell
" Vim screencast #48: Even better focus
" https://github.com/wincent/wincent

if has('autocmd')
  function! s:WincentAutocmds()
    augroup WincentAutocmds
      autocmd!

      " If Vim is rezided, then even out any splits
      autocmd VimResized * execute "normal! \<c-w>="

      " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
      autocmd VimEnter * autocmd WinEnter * let w:created=1
      autocmd VimEnter * let w:created=1

      " Disable syntax highlighting in a split without focus
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call s:focus_window()
      autocmd FocusLost,WinLeave * call s:blur_window()
    augroup END
  endfunction

  call s:WincentAutocmds()

  " Buffers that should alwyas have syntax highlighting
  let g:WincentColorColumnBlacklist = ['diff', 'fugitiveblame', 'undotree', 'nerdtree', 'qf']

  function! s:should_colorcolumn() abort
    return index(g:WincentColorColumnBlacklist, &filetype) == -1
  endfunction

  function! s:blur_window() abort
    if s:should_colorcolumn()
      let l:settings=s:get_spell_settings()
      "ownsyntax off
      " clear text highlighting beyond the set column
      call clearmatches()
      call s:set_spell_settings(l:settings)
    endif
  endfunction

  function! s:focus_window() abort
    if s:should_colorcolumn()
      if !empty(&ft)
        let l:settings=s:get_spell_settings()
        " This is something of a hack. I believe it should be just: 'ownsyntax &ft' but that does not work...
        "execute 'ownsyntax ' . &ft
        " highlight text beyond the specified column
"        let w:m2=matchadd('ErrorMsg','\%>120v.\+',-1)
        call s:set_spell_settings(l:settings)
      endif
    endif
  endfunction

  function! s:get_spell_settings() abort
    return {
          \   'spell': &l:spell,
          \   'spellcapcheck': &l:spellcapcheck,
          \   'spellfile': &l:spellfile,
          \   'spelllang': &l:spelllang
          \ }
  endfunction

  function! s:set_spell_settings(settings) abort
    let &l:spell=a:settings.spell
    let &l:spellcapcheck=a:settings.spellcapcheck
    let &l:spellfile=a:settings.spellfile
    let &l:spelllang=a:settings.spelllang
  endfunction
endif
" }}}

"   _____                _       _                     _
"  / ____|              | |     | |                   | |
" | (___   ___ _ __ __ _| |_ ___| |__  _ __   __ _  __| |
"  \___ \ / __| '__/ _` | __/ __| '_ \| '_ \ / _` |/ _` |
"  ____) | (__| | | (_| | || (__| | | | |_) | (_| | (_| |
" |_____/ \___|_|  \__,_|\__\___|_| |_| .__/ \__,_|\__,_|
"                                     | |
"                                     |_|
" Scratchpad -----------------------------------------{{{
let g:SuperTabClosePreviewOnPopupClose = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" special behavior for editing LaTeX
au! BufNewFile,BufReadPost,BufEnter *.{latex,tex,tex.tpl} set filetype=tex foldmethod=indent
autocmd FileType tex setlocal ff=unix

au! BufNewFile,BufReadPost,BufEnter *.{c.re} set filetype=c

" disable the mouse
set mouse=
set ttymouse=

" close the current buffer without killing the split
nnoremap <leader>d :b#<bar>bd#<CR>

" enable it later via :RainbowToggle
let g:rainbow_active = 0

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

:nnoremap <leader>ag :Ack!<Space>

set wildignore=*.o,*.a,*.pyc,*.swp,.git,.git/*,*.exe

" very magic searching
nnoremap / /\v
vnoremap / /\v

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" reminder that folding exists
set foldmethod=indent
set foldlevel=1
" }}}

"   _____ _        _             _ _
"  / ____| |      | |           | (_)
" | (___ | |_ __ _| |_ _   _ ___| |_ _ __   ___
"  \___ \| __/ _` | __| | | / __| | | '_ \ / _ \
"  ____) | || (_| | |_| |_| \__ \ | | | | |  __/
" |_____/ \__\__,_|\__|\__,_|___/_|_|_| |_|\___|
" Statusline --------------------------------{{{
highlight status_line_mode_color guifg='#EEE8D5' guibg='#333333' ctermfg=155 cterm=bold term=bold
highlight status_line_arrow_color guifg='#333333' guibg='#444444' ctermfg=155 cterm=bold term=bold
highlight status_line_bg_color guifg='#EEE8D5' guibg='#444444' ctermfg=155 cterm=bold term=bold

set statusline=%#status_line_mode_color#
" Editing mode
set statusline+=%{(mode()=='n')?'\ \ normal\ ':''}
set statusline+=%{(mode()=='i')?'\ \ insert\ ':''}
set statusline+=%{(mode()=='r')?'\ \ rplace\ ':''}
set statusline+=%{(mode()=='v')?'\ \ visual\ ':''}
" Current buffer number
set statusline+=\ %n\ 
" Color
set statusline+=%#status_line_arrow_color#
" Arrow
set statusline+=
" Color
set statusline+=%#status_line_bg_color#
" If paste mode is active
set statusline+=%{&paste?'\ paste\ ':''}
" If spell checking is active
set statusline+=%{&spell?'\ spell\ ':''}
" Read only flag
set statusline+=%R
" Short filename
set statusline+=\ %t
" Filetype (as detected) using &ft instead of %Y as a lowercase alternative
set statusline+=\ (%{&ft})
" File encoding
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" Symbol to show the file has been modified
set statusline+=\ %{&modified?'✘\ ':'\ \ '}
" Right align
set statusline+=%=
" current line of total line, current column of total columns
set statusline+=\ ℓ\ %l/%L\ ᶜ\ %c/%{virtcol('$')}
" Color
set statusline+=%#status_line_arrow_color#
" Arrow
set statusline+=\ 
" Color
set statusline+=%#status_line_mode_color#
" Percent of file
set statusline+=\ %3p%%\ 
" }}}
