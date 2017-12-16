# Computer Setup and Management

This is how I set up a new computer/manage my current computer.

As I change what I have installed, tools I use, configurations I set, etc., I immediately update this repo. This keeps my environment organized and deterministic. Well, most of the time at least.

Since I always try to avoid reinventing the wheel and instead like to find best-in-breed resources, this setup relies heavily on other tried-and-true setups, configurations, and conventions, with my tools and small configurations added on.

These steps set up a brand new mac out of the box.

# The Steps

- Map caps lock key to escape.
- Install used applications from the Mac App store, including xcode (required for MacVim).
- Open/setup xcode
- Run the Thoughtbot setup script from [here](https://github.com/thoughtbot/laptop).
- Install the yadr dotfiles from [here](https://github.com/skwp/dotfiles).
- Copy or symlink `.gitconfig.user`, `.vimrc.before`, `.gvimrc`, `.zsh.before`, `.zsh.after`, and `.zsh.prompts` to `~/`.
- Install user apps and etc. by running `install_user.sh`.
- Install dev apps and etc. by running `install_dev.sh`.
- Configure iTerm so new tabs open in same directory as last session.
- Sync 1Password vault.
- Add Google account to computer.
- Symlink MacVim (`ln -s /usr/local/Cellar/macvim/**version**/bin/mvim /usr/local/bin`)
- Symlink VeraCrypt (`ln -s /Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt /usr/local/bin/veracrypt`)
- Create ssh key, instructions [here](https://help.github.com/articles/generating-ssh-keys/).
- Add ssh key to Github, Heroku, and so on.
- Set Mac defaults by running `update_mac_settings.sh`.
- Install used applications from Setapp.
- Setup Alfred, Google Drive, Bartender.
- Change computer name.
- Setup personal secure backup scheme. Further details in Block.
