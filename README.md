# Computer Setup and Management

This is how I set up a new computer/manage my current computer.

As I change what I have installed, tools I use, configurations I set, etc., I immediately update this repo. This keeps my environment organized and deterministic. Well, most of the time at least.

Since I always try to avoid reinventing the wheel and instead like to find best-in-breed resources, this setup relies heavily on other tried-and-true setups, configurations, and conventions, with my tools and small configurations added on.

These steps set up a brand new mac out of the box.

# The Steps

- Map caps lock key to escape (go to keyboard settings -> modifier keys).
- Install used applications from the Mac App store
  - namely: Xcode, Strongbox, 1Blocker, 
- Open/setup Xcode
- Run the [Thoughtbot setup script](https://github.com/thoughtbot/laptop).
- Clone this repo to root with `git clone https://github.com/AdrianArtiles/computer ~/computer`
- Symlink `.zshrc`, `.gitconfig`, `.wezterm.lua`, and `.default-npm-packages` to `~/`.
  - can run `for file in .zshrc .gitconfig .wezterm.lua .default-npm-packages; do ln -s ~/computer/$file ~/; done`
- Install user apps and such by running `sh install_user.sh`.
- Install dev apps and such by running `sh install_dev.sh`.
- Install [prezto](https://github.com/sorin-ionescu/prezto).
  - update `.zshrc` to replace entries in `~/.zprezto/runcoms/zpreztorc`
- Install [LazyVim](https://github.com/LazyVim/LazyVim).
- Sync keepass vault (using Strongbox).
- Add Google account to computer (add to settings -> Internet Accounts).
- Create ssh key ([instructions](https://help.github.com/articles/generating-ssh-keys/)).
- Add ssh key where needed (Github, Heroku, and so on).
- Set Mac defaults using commands from [MacOS Defaults](https://macos-defaults.com/).
- Install favorited applications from Setapp.
  - namely: Bartender, CleanShot, TablePlus, Dash, DevUtils, iStat Menus, CloudMounter, Numi
- Setup Raycast, Hyperkey, Google Drive, Bartender.
- Change computer name (under settings -> general).
- Symlink VeraCrypt (`ln -s /Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt /usr/local/bin/veracrypt`)

# Misc

## Setup Postgres
```shell
createdb
createuser -s postgres
```
