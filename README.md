# Computer Setup and Management

This is how I set up a new computer/manage my current computer.

As I change what I have installed, tools I use, configurations I set, etc., I update this repo. This keeps my environment organized and deterministic. Usually.

Since I always try to avoid reinventing the wheel and instead like to find best-in-breed resources, this setup relies heavily on other tried-and-true setups, configurations, and conventions, with my tools and small configurations added on.

These steps set up a brand new mac out of the box.

# The Steps

- Map caps lock key to escape (go to keyboard settings -> modifier keys).
- Install used applications from the Mac App store
  - namely: Xcode, 1Blocker
- Open/setup Xcode
- Run the [Thoughtbot setup script](https://github.com/thoughtbot/laptop).
- Clone this repo to root with `git clone https://github.com/AdrianArtiles/computer ~/`
- Install user apps by running `sh install_user.sh`.
- Install dev apps by running `sh install_dev.sh`.
- Install [prezto](https://github.com/sorin-ionescu/prezto).
  - update `.zshrc` to replace entries in `~/.zprezto/runcoms/zpreztorc`
- Install [LazyVim](https://github.com/LazyVim/LazyVim).
- Install [tmux config](https://github.com/gpakosz/.tmux)
- Add Google account to computer (add to settings -> Internet Accounts).
- Create ssh key ([instructions](https://help.github.com/articles/generating-ssh-keys/)).
- Add ssh key where needed (GitHub and so on).
- Set Mac defaults using commands from [MacOS Defaults](https://macos-defaults.com/).
- Install favorited applications from Setapp.
  - namely: CleanShot, TablePlus, Dash, DevUtils, CloudMounter, Numi
- Setup Raycast, Hyperkey.
- Change computer name (under settings -> general).

# Misc

Place customizations in `~/.zshrc.local` which is sourced at the end of `~/.zshrc`.
