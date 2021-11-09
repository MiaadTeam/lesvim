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

- [using `starship` as you default Shell prompt.](https://github.com/starship/starship)

  It is the minimal, blazing-fast, and infinitely customizable prompt for any shell!

  [It's my `starship.toml`](https://raw.githubusercontent.com/hemedani/dotfiles/main/starship.toml), you should put it in `$HOME/.config/starship.toml`

# Installing:

- Install `Rust` with the help of [own doc](https://www.rust-lang.org/tools/install)

- Install `Node JS`, [using fnm](https://github.com/Schniz/fnm) for installing Node.js runtime as it's so fast.

- Install `Deno` with the help of [own doc](https://deno.land/#installation)

- Install `Neovim` and `Lua` [neovim and lua](https://github.com/neovim/neovim/wiki/Installing-Neovim), please install nightly version of neovim and install LuaJit.

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
