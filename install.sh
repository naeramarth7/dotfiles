#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

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
brew install homebrew/php/php55 --with-gmp

# Install brew-cask
brew tap caskroom/cask
brew install brew-cask
brew cask install xquartz

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew tap homebrew/x11
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
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
\curl -sSL https://get.rvm.io | bash -s stable

# Install tmux plugin manager and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator

# Install other gems
gem install maid

# Install nvm and node
brew install nvm
nvm install node

# Use nodejs as default
nvm alias default node
nvm use node

# Install node modules
npm i -g gulp
npm i -g grunt
npm i -g bower

# Install python
brew install python

# Install powerline for cli
pip install powerline-status

# Install powerline fonts
eval $(pwd -P)/.powerline-fonts/install.sh

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
brew install vim

# Install rcm
brew install rcm

# Run rcm to link dotfiles
env RCRC=$(pwd -P)/rcrc rcup

# Install docker, etc.
brew install docker
brew install docker-compose
brew install docker-machine
brew install docker-machine-driver-xhyve

brew install dinghy --HEAD
brew install xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# Install custom fonts
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-fira-mono
brew cask install font-fira-mono-for-powerline
brew cask install font-fira-sans
brew cask install font-source-code-pro

# Install other software via cask
brew cask install airmail-beta
brew cask install launchrocket
brew cask install gas-mask
brew cask install xtrafinder

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
