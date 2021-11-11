![alah-copy](https://user-images.githubusercontent.com/6236123/140812913-ccad531c-2f55-4ef8-908e-bba2387da714.jpg)

First of all, see some screen shot:

<img width="1671" alt="Screen Shot 1400-08-18 at 00 19 33" src="https://user-images.githubusercontent.com/6236123/140816097-850f4503-6fe2-4db8-8b12-9a201a6974c2.png">
<img width="1680" alt="Screen Shot 1400-08-18 at 19 05 55" src="https://user-images.githubusercontent.com/6236123/140955086-c2236f06-c279-4430-b4a7-8e722d874bff.png">
<img width="1680" alt="Screen Shot 1400-08-18 at 23 11 12" src="https://user-images.githubusercontent.com/6236123/140993424-525cf9d2-4530-4412-9f4b-44d29cfa9964.png">

# Prerequisites:

### Recommendation :

- We highly recommend using `Linux` or `Mac` as your operating system.

- [Using `Wezterm` as your default Terminal emulator.](https://github.com/wez/wezterm)

  It is a GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust

  [It's my `wezterm.lua`](https://raw.githubusercontent.com/hemedani/dotfiles/main/wezterm/wezterm.lua), you should put it in `$HOME/.config/wezterm/wezterm.lua`:

- [Using `Fish SHELL` as your default Shell.](https://github.com/fish-shell/fish-shell)

  It is a user-friendly command line shell.

- [Using `starship` as you default Shell prompt.](https://github.com/starship/starship)

  It is the minimal, blazing-fast, and infinitely customizable prompt for any shell!

  [It's my `starship.toml`](https://raw.githubusercontent.com/hemedani/dotfiles/main/starship.toml), you should put it in `$HOME/.config/starship.toml`

- Using [`lazygit`](https://github.com/jesseduffield/lazygit) or [`GitUI`](https://github.com/extrawurst/gitui) for interacting with GIT it's is:

  simple terminal UI for git commands,

  Blazing 💥 fast terminal-ui for git written in rust 🦀

- Using [`exa`](https://github.com/ogham/exa) as a `ls` command in terminal:

  A modern replacement for ‘ls’.

  I personally set ll alias to `exa --tree --level=2 -a --long --header --accessed` with this functions:
  ```fish
  function ll --wraps=ls --wraps=exa --description 'List contents of directory using exa tree'
      exa --tree --level=2 -a --long --header --accessed --git $argv
  end
  ```

- Using [`zoxide`](https://github.com/ajeetdsouza/zoxide) as a `cd` command in terminal:

  A smarter cd command. Supports all major shells.

# Installing:

- Install `Rust` with the help of [own doc](https://www.rust-lang.org/tools/install)
- Install `Node JS`, [using fnm](https://github.com/Schniz/fnm) for installing Node.js runtime as it's so fast.
- Install `Deno` with the help of [own doc](https://deno.land/#installation)
- Install `Neovim` and `Lua` [neovim and lua](https://github.com/neovim/neovim/wiki/Installing-Neovim), please install nightly version of neovim and install LuaJit.
- Install [`Cascadia Code`](https://github.com/microsoft/cascadia-code), [`Hack Nerd`](https://github.com/ryanoasis/nerd-fonts) and [`Adobe Arabic`](https://www.download-free-fonts.com/details/75203/adobe-arabic-regular) fonts

### Installing the Formatter:

The major problem regarding performance of IDE or IDE-Like is owing to the process of formatting documents. So we aim to speed up this process as much as possible.

We are trying to format documents with utils written in rust `RUST`

- [install `dprint`](https://github.com/dprint/dprint) and set it to your `$PATH` :

  Pluggable and configurable code formatting platform written in Rust.

  [It's my `dprint.json`](https://raw.githubusercontent.com/hemedani/dotfiles/main/dpript/dprint.json) file, you should put it in `$HOME/.config/dotfiles/dpript/dprint.json`

- [install `stylua`](https://github.com/JohnnyMorganz/StyLua) and set it to your `$PATH` :

  An opinionated Lua code formatter written in rust

- Install `prettier` globally: `npm i -g prettier` (Sorry for using this unperformant package, however we need it just for a few filetype)

### Install LSPs:

`Deno` and `Rust` LSPs are installed and attached to the relevant buffer when you execute `nvim` command on your proper root project;

- For installing `tsserver` LSP just run: `npm install -g typescript typescript-language-server`. You can read the rest of its doc [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver)

- For installing `sumneko_lua` LSP read [this doc](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run) and [this doc](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua)

### Setting Up:

- Copy or clone this repo to `.config/nvim` :

  `git clone https://github.com/MiaadTeam/lesvim.git ~/.config/nvim`

- Install plugins :
  - `:PackerInstall`
  - `:PackerCompile`

    Please quit and reopen neovim and execute `:PackerUpdate` and `:PackerCompile` again

After launching neovim, install these `TreeSitter` lib with `:TSInstall` :

- `:TSInstall comment`
- `:TSInstall css`
- `:TSInstall fish`
- `:TSInstall graphql`
- `:TSInstall javascript`
- `:TSInstall lua`
- `:TSInstall regex`
- `:TSInstall scss`
- `:TSInstall toml`
- `:TSInstall tsx`
- `:TSInstall vim`
- and any other you wants

# Top thing to be noticed:

## Wezterm:

### Tabs and Panes creation deletion:

- `command + shift + N` or `super + shift + N` shortcut to create a new terminal window.
- `command + t` or `super + t` shortcut to create a new terminal tab.
- `command + w` or `super + w` shortcut to close the current terminal tab.
- `command + '` or `super + '` shortcut to create a new vertical terminal split pane.
- `command + /` or `super + /` shortcut to create new horizontal terminal split pane.
- `command + x` or `super + x` shortcut to close the current terminal pane.
- `command + z` or `super + z` shortcut to toggle the current terminal pane zoom.

### Pane navigation:

- `command + ctrl + h` or `super + ctrl + h` goes to the left available pane.
- `command + ctrl + l` or `super + ctrl + l` goes to the right available pane.
- `command + ctrl + k` or `super + ctrl + k` goes to the top available pane.
- `command + ctrl + j` or `super + ctrl + j` goes to the bottom available pane.
- `command + shift + T` or `super + shift + T` shows tab navigator options.

### Pane resizing:

- `command + shift + H` or `super + shift + H` increase right available pane to left.
- `command + shift + L` or `super + shift + L` increase left available pane to right.
- `command + shift + K` or `super + shift + K` increase the bottom available pane to the top.
- `command + shift + J` or `super + shift + J` increase the top available pane to the bottom.

### Searching:

- `command + shift + F` or `super + shift + F` search for the string **"hash"** matches regardless of case.
- `command + shift + space` or `super + shift + space` go to quick search tools.

You might have already noticed that all the shortcuts here begin with `command` or `super` key except the `ctrl + tab` which is switched between available tabs, so we try not to use `command` or `super` key in `vim` shortkey.

## Vim or Neovim:

### Core:

- Relative neovim number is set to true.

  For instance, you can easily jump between lines with a quick glance by pressing `<number>j|k`.

- As mentioned in the setup section, we manage plugins with [Packer](https://github.com/wbthomason/packer.nvim).

  A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config

- We used [`tokyonight`](https://github.com/folke/tokyonight.nvim) as a theme.

  🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. It includes additional themes for Kitty, Alacrity, iTerm and Fish

### Keybinding:

If you press any key which has something bound to it and wait for a few second, `which-key` shows you an awesome hint for continuing press related keys.

The `leader` as often set to `space` key, so when you press `space` and wait for a few second `which-key` show all grouped and singleton of its binding keys. The following section briefly introduces a few of them:

- `leader + e` toggle `Nvim Tree` explorer and immediatly find current active buffer file in tree.
- `leader + /` comment just one line in `Normal and Visual` mode.(commenting keybinding has been explained below)
- `leader + c` close current active buffer.
- `leader + w` manipulate splited buffers in current window.(create and modify slipt window explained below)
- `leader + f` open Telescope and find any file fuzzy in cwd.
- `leader + q` quit nvim
- `leader + t` show lsp action menu
- `leader + r` format current buffer.
- `leader + s` searching sections
  - `b` searching branch and checkout to it.
  - `c` searching color schema and set it.
  - `C` searching command and execute it.
  - `f` find file in this cwd.
  - `h` searching in all help.
  - `k` searching in all keymaps.
- `leader + b` buffer things
  - `j` pick buffer by first character
  - `f` find buffer in telescope
  - `w` wipe buffer exept the current one
  - `r` close all buffer to right
  - `l` close all buffer to left
  - `d` sort all automaticly by directory
  - `n` sort all buffer by language
  - `t` sort all automaticly by tabs

### Plugins:

- We use [`windline`](https://github.com/windwp/windline.nvim) for the status line:

  Animation status line, floating window status line. Use **lua + luv** would make some wind.

- We use [`Telescope`](https://github.com/nvim-telescope/telescope.nvim) as a finder modal:

  Find, Filter, Preview, Pick. All lua, all the time.

- We use [`which-key.nvim`](https://github.com/folke/which-key.nvim) for amazing keybinding:

  💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

- We use [`alpha-nvim`](https://github.com/goolord/alpha-nvim) for Dashboard like things:

  a lua powered greeter like vim-startify / dashboard-nvim

- We use [`Comment`](https://github.com/numToStr/Comment.nvim) and [`nvim-ts-context-commentstring`](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) form commenting code:

  🧠 💪 // Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more.

  Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

- We use [`format.nvim`](https://github.com/lukas-reineke/format.nvim) for formatting document:

  Neovim lua plugin to format the current buffer with external executables

- We use [`fugitive`](https://github.com/tpope/vim-fugitive) as a git ui for vim:

  fugitive.vim: A Git wrapper so awesome, it should be illegal

- We use [`nvim-cursorline`](https://github.com/yamatsum/nvim-cursorline) for the highlighted word:

  A plugin for neovim that highlights cursor words and lines

### LSP:

- Press `gd` to jump to the definition word under the curser.
