#!/usr/bin/env zsh

# Set install target for brew cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Install Homebrew itself
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade --all

# Install "San Francisco" font
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts

# Install rvm, ruby
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable

source /Users/$(whoami)/.rvm/scripts/rvm
rvm install 3.1.2
. ~/.rvm/scripts/rvm
rvm use 3.1.2

# Install tmux plugin manager and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator --user-install

# Install dependencies via brew
brew bundle --file=~/brew/Brewfile

# Run rcm to link dotfiles
env RCRC=$(pwd -P)/rcrc rcup

# Install node modules
npm i -G git-recent
npm i -G diff-so-fancy

# Settings for diff-so-fancy
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

# Install zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin

# Add zsh from brew to /etc/shells file
if ! grep -Fxq "/usr/local/bin/zsh" /etc/shells; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

# Change shell to zsh installed with brew
if [[ $SHELL != /usr/local/bin/zsh ]]; then
  chsh -s /usr/local/bin/zsh
fi

# Install vim (after python to compile with Homebrew's python)
#brew install macvim --with-override-system-vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

# Install asdf plugins
asdf plugin add nodejs
asdf plugin add dart
asdf plugin add flutter

~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install

# Remove outdated versions from the cellar.
brew cleanup
