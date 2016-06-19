#!/usr/bin/env zsh

echo -en "\r\033[K > .zshrc start"

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Disable zsh's double check on rm with * argument
setopt rmstarsilent

# Load Plugins

# zgen seems faster than antigen
source $ZDOTDIR/plugins/zgen.src
source $ZDOTDIR/plugins/lazy.src
source $ZDOTDIR/plugins/fasd.src

source $HOME/.rvm/scripts/rvm
source $(brew --prefix nvm)/nvm.sh

echo -en "\r\033[K > .zshrc end"
echo -en "\r\033[K"
