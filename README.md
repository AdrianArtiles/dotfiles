# Computer Setup and Management

This is how I set up a new computer/manage my current computer.

As I change what I have installed, tools I use, configurations I set, etc., I immediately update this repo. This keeps my environment organized and deterministic. Well, most of the time at least.

Since I always try to avoid reinventing the wheel and instead like to find best-in-breed resources, this setup relies heavily on other tried-and-true setups, configurations, and conventions, with my tools and small configurations added on.

These steps set up a brand new mac out of the box.

# The Steps

- Map caps lock key to escape.
- Install used applications from the Mac App store, including xcode.
- Open/setup xcode
- Run the Thoughtbot setup script from [here](https://github.com/thoughtbot/laptop).
- Clone this repo to `~/`
- Symlink `.zshrc`, `.vimrc`, `.gitconfig`, and `.default-npm-packages` to `~/`.
- Install LazyVim
- Install user apps and etc. by running `install_user.sh`.
- Install dev apps and etc. by running `install_dev.sh`.
- Install prezto
  - update `.zshrc` to replace entries in `~/.zprezto/runcoms/zpreztorc`
- Configure iTerm so new tabs open in same directory as last session, and set chosen nerdfont
- Sync keepass vault (strongbox).
- Add Google account to computer.
- Symlink VeraCrypt (`ln -s /Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt /usr/local/bin/veracrypt`)
- Create ssh key, instructions [here](https://help.github.com/articles/generating-ssh-keys/).
- Add ssh key to Github, Heroku, and so on.
- Set Mac defaults using commands from [MacOS Defaults](https://macos-defaults.com/). (Inspiration [here](https://github.com/mathiasbynens/dotfiles/blob/main/.macos))
- Install favorited applications from Setapp.
- Setup Raycast, Google Drive, Bartender.
- Change computer name.
- Setup personal secure backup scheme. Further details in Block.

# Misc

## Setup Postgres
```shell
createdb
createuser -s postgres
```
