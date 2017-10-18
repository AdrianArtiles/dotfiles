# Laptop Setup

This is how I set up a new computer. This outlines which setup scripts and dotfiles I use, along with some small customizations. Convention over configuration!

This is assuming a brand new Mac out of the box.

# The Steps

- Change computer name.
- Download everything from the app store, include xcode (for MacVim).
- Install used Setapp applications
- Run the Thoughtbot setup script from [here](https://github.com/thoughtbot/laptop).
- Install the yadr dotfiles from [here](https://github.com/skwp/dotfiles).
- Copy `.gitconfig.user`, `.vimrc.before`, `.gvimrc`, `.zsh.before`, `.zsh.after`, and `.zsh.prompts` to `~`.
- Set Mac defaults by running `update_mac_settings.sh`.
- Install non-dev apps and stuff by running `install_user.sh`.
- Install dev stuff `install_dev.sh`.
- Finish setup from yadr dotfiles [here](https://github.com/skwp/dotfiles#wait-youre-not-done-do-this).
- Move google chrome out of cask to ~/Application folder so it works with 1password.
- Sync 1password vault.
- Add Google account to computer.
- Create ssh key, instructions [here](https://help.github.com/articles/generating-ssh-keys/).
- Add ssh key to Github and Heroku, along with anywhere else.
- Update iterm so new tabs open in same directory as last session.
- Symlink MacVim (`ln -s /usr/local/Cellar/macvim/**version**/bin/mvim /usr/local/bin`)
