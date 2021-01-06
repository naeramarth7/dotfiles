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

# Make sure we’re using the latest Homebrew.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew link coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
brew link moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew link findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew link gnu-sed

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install grep --with-default-names
brew install openssh

# Install brew-cask
brew tap caskroom/cask
brew cask install xquartz

# Install java
brew cask install java

# Install "San Francisco" font
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts

# Install other useful binaries.
brew install dark-mode
brew install exa
brew install fasd
brew install gettext
brew install git
brew install git-lfs
brew install gnupg
brew install httpie
brew install imagemagick --with-webp
brew install p7zip
brew install pv
brew install screen
brew install tig
brew install tmux

brew tap beeftornado/rmtree

# Install rvm, ruby, rails
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | zsh -s stable

source /Users/$(whoami)/.rvm/scripts/rvm
rvm install 2.7

# Install tmux plugin manager and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator

# Install other gems
gem install maid

# Install build tools, etc
brew install gradle
brew install maven
brew install ansible

# Install n and node
brew install n
n latest

# Install yarn
brew install yarn

# Install node modules
npm i -G git-recent
npm i -G diff-so-fancy

# Settings for diff-so-fancy
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

# Install python
brew install python

# Install glances (system monitoring)
pip3 install glances
pip3 install bottle

# Install powerline for cli
pip3 install powerline-status

# Install zsh
brew install zsh
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

# Install rcm
brew tap thoughtbot/formulae
brew install rcm

# Run rcm to link dotfiles
env RCRC=$(pwd -P)/rcrc rcup

# Install vim plugins
vim +PluginInstall +qall

# Install other software via cask
brew tap caskroom/versions
brew cask install alfred
brew cask install amazon-music
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install bitwarden
#brew cask install cdock
brew cask install docker
brew cask install easysimbl
brew cask install evernote
brew cask install fantastical
brew cask install flux
brew cask install gas-mask
brew cask install google-drive
brew cask install google-nik-collection
brew cask install growlnotify
brew cask install imageoptim
brew cask install iterm2
#brew cask install karabiner-elements
brew cask install launchrocket
brew cask install netspot
brew cask install numi
#brew cask install omnidisksweeper
#brew cask install opera-developer
#brew cask install osxfuse
#brew cask install razer-synapse
#brew cask install safari-technology-preview
brew cask install scroll-reverser
#brew cask install seil
brew cask install sequel-pro
brew cask install soda-player
brew cask install spotify
brew cask install switchresx
#brew cask install tnefs-enough
brew cask install transmission
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
#brew cask install visual-studio-code-insiders
brew cask install vlc
brew cask install xquartz
#brew cask install xtrafinder

# Work related
#brew cask install hipchat
#brew cask install slack

# Add ntfs support
# Needs to be installed after osxfuse >3
brew install ntfs-3g

# Install custom fonts
brew tap homebrow/cask-fonts
brew cask install font-input

# Install asdf
brew install asdf

asdf plugin add nodejs
asdf plugin add dart
asdf plugin add flutter


~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install

# Remove outdated versions from the cellar.
brew cleanup

# install nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
. /Users/svenf/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

# use home-manager configuration to install packages
home-manager switch

