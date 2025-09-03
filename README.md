# Dotfiles

This is how I set up a new computer/manage my current computer.

I generally keep this up to date. After an initial assessment, if I trial or adopt something it usually will be added here.

I try to avoid reinventing the wheel and instead like to find best-in-breed resources, so this setup is heavily built on other tried-and-true setups, configurations, and conventions. I try to maximize the value-per-line while keeping things as minimal as possible.

These steps set up a brand new mac out of the box.

## Steps

- Map caps lock key to escape (go to keyboard settings -> modifier keys).
- Install used applications from the Mac App store
  - namely: Xcode, 1Blocker
- Open/setup Xcode
- Clone this repo to root with `git clone https://github.com/AdrianArtiles/dotfiles ~/`
  - move the git directory to `~/.dotfiles.git`
  - edit with `cd ~; GIT_DIR=~/.dotfiles.git nvim .`
- run `run_setup`
- Install apps and tools by running `brew bundle --global`.
- Install [LazyVim](https://github.com/LazyVim/LazyVim).
- Install [tmux config](https://github.com/gpakosz/.tmux)
- Add Google account to computer (add to settings -> Internet Accounts).
- Create ssh key ([instructions](https://help.github.com/articles/generating-ssh-keys/)).
- Add ssh key where needed (GitHub and so on).
- Set Mac defaults using commands from [MacOS Defaults](https://macos-defaults.com/).
- Install favorited applications from Setapp.
  - namely: CleanShot, TablePlus, DevUtils, Numi
- Setup Raycast, Hyperkey.
- Change computer name (under settings -> general).

## Tips

- Place customizations in `~/.zshrc.local` which is sourced at the end of `~/.zshrc`.
- To avoid entering sudo password constantly, use `sudo visudo` to add `Defaults timestamp_timeout=30` to cache the password during the install (then change the timeout to something shorter)
- These dotfiles used to depend on [Thoughtbot setup script](https://github.com/thoughtbot/laptop) and [prezto](https://github.com/sorin-ionescu/prezto) which can still serve as references.
