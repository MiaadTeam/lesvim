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

# Installing:

- Install `Rust` with the help of [own doc](https://www.rust-lang.org/tools/install)

- Install `Node JS`, [using fnm](https://github.com/Schniz/fnm) for installing Node.js runtime as it's so fast.

- Install `Deno` with the help of [own doc](https://deno.land/#installation)

- Install `Neovim` and `Lua` [neovim and lua](https://github.com/neovim/neovim/wiki/Installing-Neovim), please install nightly version of neovim and install LuaJit.

- Install [`Cascadia Code`](https://github.com/microsoft/cascadia-code), [`Hack Nerd`](https://github.com/ryanoasis/nerd-fonts) and [`Adobe Arabic`](https://www.download-free-fonts.com/details/75203/adobe-arabic-regular) fonts

### Installing the Formatter:

The major problem regarding performance of IDE or IDE-Like is owing to th process of formating document. So we aim to to speed up this procces as much as possible.

We are trying to format documents with utils writen in rust `RUST`

- [install `dprint`](https://github.com/dprint/dprint) and set it to your `$PATH` :

  Pluggable and configurable code formatting platform written in Rust.

  [It's my `dprint.json`](https://raw.githubusercontent.com/hemedani/dotfiles/main/dpript/dprint.json) file, you should put it in `$HOME/.config/dotfiles/dpript/dprint.json`

- [install `stylua`](https://github.com/JohnnyMorganz/StyLua) and set it to your `$PATH` :

  An opinionated Lua code formatter written in rust

- install `prettier` globally: `npm i -g prettier` (Sorry for using this unperformant package, however we need it just for a few filetype)

### Install LSPs:

`Deno` and `Rust` LSPs are installed and attached to the relavant buffer when you execute `nvim` command on your proper root project;

- For installing `tsserver` LSP just run: `npm install -g typescript typescript-language-server`. You can read the rest of its doc [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver)

- For installing `sumneko_lua` LSP read [this doc](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run) and [this doc](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua)

### Setting Up:

- Copy or clone this repo to `.config/nvim` :

  `git clone https://github.com/MiaadTeam/lesvim.git ~/.config/nvim`

- install plugins :
  - `:PackerInstall`
  - `:PackerCompile`

    please quit and reopen neovim and execute `:PackerUpdate` and `:PackerCompile` again

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

- `command + shift + N` or `super + shift + N` shortkey create new terminal window.

- `command + t` or `super + t` shortkey create new terminal tab.

- `command + w` or `super + w` shortkey close current terminal tab.

- `command + '` or `super + '` shortkey create new vertical terminal split pane.

- `command + /` or `super + /` shortkey create new horizontal terminal split pane.

- `command + x` or `super + x` shortkey close current terminal pane.

- `command + z` or `super + z` shortkey toggle current terminal pane zoom.

### Pane navigation:

- `command + ctrl + h` or `super + ctrl + h` go to left avalibe pane.

- `command + ctrl + l` or `super + ctrl + l` go to right avalibe pane.

- `command + ctrl + k` or `super + ctrl + k` go to top avalibe pane.

- `command + ctrl + j` or `super + ctrl + j` go to bottom avalibe pane.

- `command + shift + T` or `super + shift + T` show tab navigator options.

### Pane resizing:

- `command + shift + H` or `super + shift + H` increase right avalibe pane to left.

- `command + shift + L` or `super + shift + L` increase left avalibe pane to right.

- `command + shift + K` or `super + shift + K` increase bottom avalibe pane to top.

- `command + shift + J` or `super + shift + J` increase top avalibe pane to bottom.

### Searching:

- `command + shift + F` or `super + shift + F` search for the string "hash" matching regardless of case.

- `command + shift + space` or `super + shift + space` go to quick search tools.

If you have noticed all the shortcuts here begin with `command` or `super` key exept the `ctrl + tab` which is switch beetwen avalibe tabs, so we try not to use `command` or `super` key in `vim` shortkey.

## Vim or Neovim:

### Core:

- relative neovim number is set to true.

  so for example you can easily jump beetwen line with a quick galance and `<number>j|k`.

- as mentioned in setup section we mannage plugins with [Packer](https://github.com/wbthomason/packer.nvim).

  A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config

- we used [`tokyonight`](https://github.com/folke/tokyonight.nvim) as a theme.

  🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish

### Keybinding:

if you press any key which somthing bind to it and waiting for a few second `which-key` show you an awesome hint for continue press related keys

the `leader` as often set to `space` key, so when you press `space` and wait for a few second `which-key` show all grouped and singleton of it's binding keys. here briefly introducing some of them:

- `leader + e` toggle `Nvim Tree` explorer and immediatly find current active buffer file in tree.
- `leader + /` comment just one line in `Normal and Visual` mode.(commenting keybinding has been explained below)
- `leader + c` close current active buffer.
- `leader + w` manipulate splited buffers in current window.(create and modify slipt window explained below)

### Plugins:

- we use [`windline`](https://github.com/windwp/windline.nvim) for the status line:

  Animation statusline, floating window statusline. Use lua + luv make some wind

- we use [`Telescope`](https://github.com/nvim-telescope/telescope.nvim) as a finder modal:

  Find, Filter, Preview, Pick. All lua, all the time.

- we use [`which-key.nvim`] for amazing keybinding:

  💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

- we use [`Comment`](https://github.com/numToStr/Comment.nvim) and [`nvim-ts-context-commentstring`](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) form commenting code:

  🧠 💪 // Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more.

  Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

- we use [`format.nvim`](https://github.com/lukas-reineke/format.nvim) for formating document:

  Neovim lua plugin to format the current buffer with external executables

- we use [`fugitive`](https://github.com/tpope/vim-fugitive) as a git ui for vim:

  fugitive.vim: A Git wrapper so awesome, it should be illegal

- we use [`nvim-cursorline`](https://github.com/yamatsum/nvim-cursorline) for highlight word:

  A plugin for neovim that highlights cursor words and lines

### LSP:

- press `gd` to jump to the definition word of under curser
