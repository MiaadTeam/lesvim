![alah-copy](https://user-images.githubusercontent.com/6236123/140812913-ccad531c-2f55-4ef8-908e-bba2387da714.jpg)

we want to create a pro development area so please do this instruction step by step :

firt of all thing is OS (operation system), so please install a `linux` or use `mac os`

# Why `Linux` or `Mac OS` :

[[TODO]]

We recommand :

- [using `Wezterm` as your default Terminal emulator.](https://github.com/wez/wezterm)

  It is GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust

  [It's my `wezterm.lua`](https://raw.githubusercontent.com/hemedani/dotfiles/main/wezterm/wezterm.lua), you should put it in `$HOME/.config/wezterm/wezterm.lua` :

- [using `Fish SHELL` as your default Shell.](https://github.com/fish-shell/fish-shell)

  It is he user-friendly command line shell.

- [using `starship` as you default Shell prompt.](https://github.com/starship/starship)

  It is the minimal, blazing-fast, and infinitely customizable prompt for any shell!

  [It's my `starship.toml`](https://raw.githubusercontent.com/hemedani/dotfiles/main/starship.toml), you should pu it in `$HOME/.config/starship.toml`

install `rust` with the help of [own doc](https://www.rust-lang.org/tools/install)

install `node js`, [using fnm](https://github.com/Schniz/fnm) for install nodejs please (it's so fast)

The major problem of IDE or IDE-Like performance relate to formating document. So we try to speed up this procces as much as possible.

We trying to format document with utils writen in rust `RUST`

- [install `dprint`](https://github.com/dprint/dprint) and set it to your `$PATH` :

  Pluggable and configurable code formatting platform written in Rust.

  [It's my `dprint.json`](https://raw.githubusercontent.com/hemedani/dotfiles/main/dpript/dprint.json) file, you should put it in `$HOME/.config/dotfiles/dpript/dprint.json`

- [install `stylua`](https://github.com/JohnnyMorganz/StyLua) and set it to your `$PATH` :

  An opinionated Lua code formatter written in rust

- install `prettier` globally: `npm i -g prettier` (sorry for using this shamefull lib we need it just for a few filetype)

copy or clone this repo to `.config/nvim`

So know we can [install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim), please install nightly version

after lunching neovim install these `TreeSitter` lib with `TSInstall` :

- `TSInstall tsx`
