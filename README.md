# Vim Configuration
<!-- vim-markdown-toc GFM -->

* [External Dependencies](#external-dependencies)
* [Initial Configuration](#initial-configuration)
    * [YouCompleteMe](#youcompleteme)
        * [Installation of c/c++ support](#installation-of-cc-support)
        * [Faster regex engine](#faster-regex-engine)
        * [Javascript/typescript](#javascripttypescript)
        * [Rust](#rust)
* [Environment Settings](#environment-settings)
    * [GitHub styled Markdown](#github-styled-markdown)
* [Mappings](#mappings)
    * [Leader Key Mappings](#leader-key-mappings)
* [Plugins](#plugins)
    * [Ultisnips](#ultisnips)
        * [Options](#options)
    * [fzf](#fzf)

<!-- vim-markdown-toc -->
## External Dependencies

These tools must exist in the user's `PATH`:
* [curl](https://curl.haxx.se/download.html)
* [yarn](https://yarnpkg.com/getting-started/install)
* [nodejs](https://nodejs.org/en/download/)
* [fzf](https://github.com/junegunn/fzf#installation)
* [ag](https://github.com/ggreer/the_silver_searcher)
* [python](https://www.python.org/downloads/) (versions 2 **and** 3)
* [bat](https://github.com/sharkdp/bat)
* [libclang](https://llvm.org/)
* [git](https://git-scm.com/downloads)
* [Adobe Source Code Pro Font](https://github.com/adobe-fonts/source-code-pro/releases)
* [cmake](https://cmake.org/download/)
* C compiler, e.g. Visual Studio or gcc

**Note 1 for Python**: The python version **must** match the version used do compile Vim. You can
find out what version Vim is using by running `:version`.

**Note 2 for Python**: The 32 or 64 bit versions of python **and** Vim **must match**. 64 bit Vim,
will **not** work with 32 bit python. Just as 32 bit Vim does not work with 64 bit python.

## Initial Configuration

**Note:** for windows: depending on the shell you are using (command window v. power shell) you
might have to replace `~` with `%userprofile%`. Of course you can always use `%userprofile%`
instead just to be safe.

The plugin manager of choice is `vim-plug` and can be installed via:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
or if you are behind a proxy:
```bash
curl -fLo ~/.vim/autoload/plug.vim -x <[protocol://][user:password@]proxyhost[:port]> \
   --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Once plug has been downloaded, you can simply run `:PlugInstall` from within Vim.

### YouCompleteMe

This example is specific for the additional support of c/c++, rust, and javascript and is meant
to supplement the full guide found [here]( https://github.com/ycm-core/YouCompleteMe#full-installation-guide).

#### Installation of c/c++ support

```bash
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Visual Studio 15 Win64" -DPATH_TO_LLVM_ROOT=C:\LLVM . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
```

**Note 1:** The `-G` argument "Visual Studio 15 Win64" is for Visual Studio 2017 on a 64-bit machine.

Another example using Visual Studio Studio 2019 on a 64-bit machine:
```bash
cmake -G "Visual Studio 16" -A"x64"  -DPATH_TO_LLVM_ROOT=C:\LLVM . %userprofile%/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
```

**Note 2:** The `-DPATH_TO_LLVM_ROOT` is the path given to install libclang.

#### Faster regex engine
```bash
cd ~
mkdir regex_build
cd regex_build
cmake -G "Visual Studio 15 Win64" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex 
cmake --build . --target _regex --config Release
```

#### Javascript/typescript
```bash
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd
npm install -g --prefix third_party/tsserver typescript
```

#### Rust
```bash
cd ~
mkdir rustup_home_temp
set RUSTUP_HOME=~/rustup_home_temp
rustup toolchain install nightly
rustup default nightly
rustup component add rls rust-analysis rust-src
```
* Ensure that `~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/rls` directory exists and is empty.
* Go into the `~/rustup_home_temp` and then into `toolchains/<toolchain>`.
* Finally, move everything from that directory to  `~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/rls`.

## Environment Settings

In order to use ag and fzf together you have to tell fzf that ag is available. For linux:
```bash
# Place in ~./bashrc
if type ag &> /dev/null; then
   export FZF_DEFAULT_COMMAND='ag -g ""'
fi
```
For Windows you need do have the environment variable: `FZF_DEFAULT_COMMAND` set to
`ag -g ""`.

**Note**: This step is optional as fzf will work without ag, however ag is faster and will
automatically ignore .git related content.

### GitHub styled Markdown

To achieve a more stylish markdown you will need to download the CSS style from GitHub:
```bash
curl -fLo ~/vimfiles/markdown/github-markdown.css \
   --create-dirs https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css
```
or again, if you are behind a proxy:
```bash
curl -fLo ~/vimfiles/markdown/github-markdown.css -x <[protocol://][user:password@]proxyhost[:port]> \
   --create-dirs https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css
```

After `vim-plug` has been installed simply run `:PlugInstall` from inside Vim.

## Mappings

### Leader Key Mappings
The leader key is mapped to: <kbd>SPACE</kbd>

| Leader Mapping | Function |
| -------------- | -------- |
 `<leader>ag`    | Search with ag
 `<leader>d`     | Close the current buffer (`:bd`)
 `<leader>de`    | Toggle umlaut feature (using ae, ue, oe, and ss for ä, ü, ö, and ß)
 `<leader>det`   | Toggle LaTeX umlaut feature (using ae, ue, oe, and ss for the equivalent LaTeX symbols)
 `<leader>ev`    | Edit Vimrc file
 `<leader>n`     | Clear search highlighting
 `<leader>rel`   | Toggle relative line numbers and the cursorline
 `<leader>sv`    | Source Vimrc file
 `<leader>b`     | fzf Buffer search (`:Buffers`)
 `<leader>f`     | fzf Files search (`:Files`)
 `<leader>ue`    | Open UltiSnips edit function (for the current filetype)

## Plugins
### Ultisnips

Basic structure:
```
snippet <keyword> "<text description>" [option]
<content>
endsnippet
```

Placeholders are numbered `$1`, `$2`, `$3`, etc... default content can be specified
like so `${<num>:<default>}`

#### Options
Here are the (some of the) options available in Ultisnips:
* b -- Beginning of line -- the option is expanded only if the tab trigger is the first word on
the line.
* i -- In-word expansion -- by default a snippet is expanded only if the tab trigger is the first
word on the line or is preceded by one or more whitespace characters.
A snippet with this option is expanded regardless of the preceding character.
* A -- Automatic -- the snippet will be triggered automatically when the condition matches.
The full list is `b, i, w, r, t, s, m, e, A`

### fzf

To navigate the list of findings use <kbd>CTRL</kbd>+<kbd>N</kbd> and <kbd>CTRL</kbd>+<kbd>P</kbd>.
To open a selected file:
* <kbd>ENTER</kbd>: open file in current window
* <kbd>CTRL</kbd>+<kbd>T</kbd>: open file in new tab page
* <kbd>CTRL</kbd>+<kbd>X</kbd>: open file in new horizontal window
* <kbd>CTRL</kbd>+<kbd>V</kbd>: open file in new vertical window

To close the file search, use either <kbd>ESC</kbd> or <kbd>CTRL</kbd>+<kbd>C</kbd>

