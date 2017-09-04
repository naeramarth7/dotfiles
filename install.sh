#!/usr/bin/env bash

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
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install brew-cask
brew tap caskroom/cask
brew cask install xquartz

# Install java
brew cask install java

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew tap homebrew/x11


# Install other useful binaries.
brew install dark-mode
brew install exiv2
brew install git
brew install git-lfs
brew install gpg
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install pv
brew install the_silver_searcher
brew install tmux
brew install tree
brew install webkit2png
brew install zopfli

# Additional stuff
brew install fasd
brew install httpie
brew install stow

# Install rvm, ruby, rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source /Users/$(whoami)/.rvm/scripts/rvm
rvm get stable
rvm install 2.4

# Install tmux plugin manager and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator

# Install other gems
gem install maid

# Install build tools, etc
brew install grable
brew install maven
brew install ansible

# Install n and node
brew install n
n latest

# Install yarn
brew install yarn

# Install node modules
yarn global add gulp
yarn global add grunt
yarn global add bower

yarn global add typescript@next
yarn global add eslint@next
yarn global add tslint@next

yarn global add git-recent
yarn global add diff-so-fancy

# Settings for diff-so-fancy
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

# Install python
brew install python

# Install powerline for cli
pip install powerline-status

# Install zsh
brew install zsh

# Add zsh from brew to /etc/shells file
if ! grep -Fxq "/usr/local/bin/zsh" /etc/shells; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

# Change shell to zsh installed with brew
if [[ $SHELL != /usr/local/bin/zsh ]]; then
  chsh -s /usr/local/bin/zsh
fi

# Install vim (after python to compile with Homebrew's python)
brew install macvim --with-override-system-vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install rcm
brew tap thoughtbot/formulae
brew install rcm

# Run rcm to link dotfiles
env RCRC=$(pwd -P)/rcrc rcup

# Install docker, etc.
brew cask install docker
brew install docker-compose
# brew install docker-machine
# brew install docker-machine-driver-xhyve

# brew install dinghy --HEAD
# brew install xhyve
# sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
# sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# Install other software via cask
brew tap caskroom/versions
brew cask install alfred
brew cask install airmail-beta
brew cask install amazon-music
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install boom
brew cask install cdock
brew cask install chitchat
brew cask install easysimbl
brew cask install enpass
brew cask install evernote
brew cask install fantastical
brew cask install flux
brew cask install gas-mask
brew cask install google-drive
brew cask install google-nik-collection
brew cask install growlnotify
brew cask install imageoptim
brew cask install iterm2-beta
brew cask install karabiner-elements
brew cask install launchrocket
brew cask install netspot
brew cask install numi
brew cask install omnidisksweeper
brew cask install opera-developer
brew cask install osxfuse
brew cask install razer-synapse
brew cask install safari-technology-preview
brew cask install scroll-reverser
brew cask install seil
brew cask install sequel-pro
brew cask install spotify
brew cask install switchresx
brew cask install tnefs-enough
brew cask install transmission
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install vlc
brew cask install xquartz
brew cask install xtrafinder

# Work related
brew cask install hipchat
brew cask install slack

# Add ntfs support
# Needs to be installed after osxfuse >3
brew install homebrew/fuse/ntfs-3g

# Install custom fonts
brew tap caskroom/fonts
brew cask install font-input

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
