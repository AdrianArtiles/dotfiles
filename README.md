# Laptop Setup

This is how I set up a new computer. This outlines which setup scripts and dotfiles I use, along with some small customizations. Convention over configuration!

This is assuming a brand new Mac out of the box.

# The Steps

- Change computer name.
- Map caps lock key to escape.
- Download everything from the Mac App store, include xcode (for MacVim).
- Run the Thoughtbot setup script from [here](https://github.com/thoughtbot/laptop).
- Install the yadr dotfiles from [here](https://github.com/skwp/dotfiles).
- Copy or symlink `.gitconfig.user`, `.vimrc.before`, `.gvimrc`, `.zsh.before`, `.zsh.after`, and `.zsh.prompts` to `~`.
- Install user apps and etc. by running `install_user.sh`.
- Install dev apps and etc. by running `install_dev.sh`.
- Update iTerm so new tabs open in same directory as last session.
- Sync 1Password vault.
- Add Google account to computer.
- Symlink MacVim (`ln -s /usr/local/Cellar/macvim/**version**/bin/mvim /usr/local/bin`)
- Symlink VeraCrypt (`ln -s /Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt /usr/local/bin/veracrypt`)
- Create ssh key, instructions [here](https://help.github.com/articles/generating-ssh-keys/).
- Add ssh key to Github, Heroku, and so on.
- Set Mac defaults by running `update_mac_settings.sh`.
- Install used Setapp applications
- Setup personal secure backup scheme. Further details in Block.
