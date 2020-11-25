# Vim Configuration

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

**Note 3 for Python**: Python 3 needs to be in your path!

## Initial Configuration

**Note:** for windows: depending on the shell you are using (command window v. power shell) you
might have to replace `~` with `%userprofile%`. Of course you can always use `%userprofile%`
instead just to be safe.

The plugin manager of choice is `vim-plug` and can be installed via:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
**Note:** this will also work within git bash for windows.

or if you are behind a proxy:
```bash
curl -fLo ~/.vim/autoload/plug.vim -x <[protocol://][user:password@]proxyhost[:port]> \
   --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Once plug has been downloaded, you can simply run `:PlugInstall` from within Vim.

## Neovim

<https://neovim.io/>

Neovim describes itself as "Neovim is a refactor, and sometimes redactor, in the tradition of Vim
(which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim.
Many clones and derivatives exist, some very clever—but none are Vim.
Neovim is built for users who want the good parts of Vim, and more."

In order to try Neovim while still using the "regular" Vim, the Neovim `init.vim` is included here.
All it does it point to the normal `~/.vim` so both programs can be used.

To set this up simply place `init.vim` in `~/.config/nvim/init.vim` for linux or for windows here:
`%userprofile%\AppData\Local\nvim\init.vim`.

**Note** For the GUI version of Neovim the `ginit.vim` has to be placed in
the same folder as `init.vim`.

## Neovide

<https://github.com/Kethku/neovide>

Since I am personnaly a fan of Rust this seemed like an interesting GUI to Neovim.

#### Dependencies
* Neovide requires neovim version 0.4 or greater.
* Vulkan Runtime, not the full SDK from: [Vulkan SDK](https://vulkan.lunarg.com/sdk/home)

### YouCompleteMe

This example is specific for the additional support of c/c++, rust, and javascript and is meant
to supplement the full guide found [here](https://github.com/ycm-core/YouCompleteMe#full-installation-guide).

Under windows install the latest version of Microsoft build tools: [Visual Studio 2019 Build
Tools](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16)

#### Installation of c/c++ support

```bash
cd ~/.vim/plugged/YouCompleteMe
python install.py --clangd-completer
```

*Note:* If needed you may specify the version of MS Build tools via: `--msvc=15`

#### Rust

```bash
cd ~/.vim/plugged/YouCompleteMe
python install.py --rust-completer
```

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

