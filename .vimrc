
"  _____  _             _
" |  __ \| |           (_)
" | |__) | |_   _  __ _ _ _ __  ___
" |  ___/| | | | |/ _` | | '_ \/ __|
" | |    | | |_| | (_| | | | | \__ \
" |_|    |_|\__,_|\__, |_|_| |_|___/
"                  __/ |
"                 |___/
" Plugins ----------------------{{{

" Not sure why but vim-plug was not happy without this, therefore here it is.
set rtp+=$HOME/.vim
let path='$HOME/.vim'

" Start of vim-plug
call plug#begin()

Plug 'SirVer/ultisnips'             " snippet tool
Plug 'Valloric/YouCompleteMe'       " auto-complete
Plug 'dense-analysis/ale'           " Syntax checking
Plug 'ervandew/supertab'            " allows you to use <Tab> for all your insert completion needs
Plug 'godlygeek/tabular'            " Tabular for aligning text
Plug 'haya14busa/is.vim'            " Automatically clear search highlights after you move your cursor.
Plug 'honza/vim-snippets'           " Snippets are separated from the engine.
Plug 'junegunn/fzf.vim'             " fuzzy searching
Plug 'junegunn/goyo.vim'            " goyo focused editing
Plug 'junegunn/limelight.vim'       " Dim paragraphs above and below the active paragraph.
Plug 'kana/vim-textobj-user'        " Custom text objects
Plug 'luochen1990/rainbow'          " rainbow parenthesis
Plug 'mhinz/vim-startify'           " startup
Plug 'mileszs/ack.vim'              " silver searcher via ack
Plug 'plasticboy/vim-markdown'      " markdown support
Plug 'rust-lang/rust.vim'           " rust
Plug 'tpope/vim-commentary'         " Comment stuff out.
Plug 'tpope/vim-fugitive'           " git integration
Plug 'tpope/vim-surround'           " easily modify surrounding pairs
Plug 'tpope/vim-unimpaired'         " vim navigation
Plug 'vim-scripts/argtextobj.vim'   " Function arguments as text objects

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'  }

" color theme(s)
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'
Plug 'AlessandroYorba/Sierra'
Plug 'sts10/vim-pink-moon'
Plug 'Nequo/vim-allomancer'
Plug 'koirand/tokyo-metro.vim'
Plug 'dennougorilla/azuki.vim'
Plug 'fcpg/vim-farout'
Plug 'nightsense/vim-crunchbang'
Plug 'sainnhe/gruvbox-material'
Plug 'arzg/vim-oldbook8'
Plug 'axvr/photon.vim'
Plug 'sainnhe/vim-color-forest-night'

" all Plugins must be added before this line:
call plug#end()

" file encoding - required for YouCompleteMe
set encoding=utf-8
" }}}

if has('win32')
  let g:python3_host_prog = 'C:\Python38\python.exe'
  let g:python_host_prog = 'C:\Python27\python.exe'
endif

"     /\
"    /  \   _ __  _ __   ___  __ _ _ __ __ _ _ __   ___ ___
"   / /\ \ | '_ \| '_ \ / _ \/ _` | '__/ _` | '_ \ / __/ _ \
"  / ____ \| |_) | |_) |  __/ (_| | | | (_| | | | | (_|  __/
" /_/    \_\ .__/| .__/ \___|\__,_|_|  \__,_|_| |_|\___\___|
"          | |   | |
"          |_|   |_|
" Appearance --------------------------------------------{{{

" Presentation mode will enable a light color scheme
" and it will increase the font size
let g:presentation_mode = 0

" set 256 colors
set t_Co=256

" set the colorscheme
if g:presentation_mode == 0
   set background=dark
   colo sierra
else
   set background=light
   colo PaperColor
endif

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
  if has ('nvim')
    " exec 'Guifont! Source Code Pro:h10'
    " This must be in ginit.vim for NeoVim
  else
     " normal Vim
      if g:presentation_mode == 1
          set guifont=Source\ Code\ Pro:h18
      else
          set guifont=Source\ Code\ Pro:h10
      endif
  endif
else
  " Linux Vim
  set guifont=Source\ Code\ Pro\ 10
endif

" enable syntax highlighting
syntax on

" highlight the current line
set cursorline

" shows matching pairs of (), [], or {}
set showmatch

" settings to display whitespace characters
set list                   " show whitespace
set listchars=nbsp:⦸       " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:┈┈      " BOX DRAWINGS LIGHT QUADRUPLE DASH HORIZONTAL' (U+2508, UTF-8: E2 94 88)
set listchars+=extends:»   " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«  " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•     " BULLET (U+2022, UTF-8: E2 80 A2)

" Set the directory for UltiSnips
if has('win32')
  let g:UltiSnipsSnippetsDir = "~/vimfiles/plugged/vim-snippets/UltiSnips"
else
  let g:UltiSnipsSnippetsDir = "~/.vim/plugged/vim-snippets/UltiSnips"
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
" set ttymouse=

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

nnoremap <leader>n :silent! nohls<cr>

" Next ALE finding.
nmap <silent> <M-n> :ALENext<cr>
nmap <silent> <M-e> :ALEPrevious<cr>

set lazyredraw                        " don't bother updating screen during macro playback


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

let g:tex_indent_brace = 0 " Toggle smartindent-like style for {} and [].

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
