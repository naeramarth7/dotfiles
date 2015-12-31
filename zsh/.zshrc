#!/usr/bin/env zsh

echo -en "\r\033[K > .zshrc start"

# Load Plugins

# zgen seems faster than antigen
source $ZDOTDIR/plugins/zgen.src
source $ZDOTDIR/plugins/lazy.src
source $ZDOTDIR/plugins/fasd.src

# rvm (not lazy-able)
source $HOME/.rvm/scripts/rvm

echo -en "\r\033[K > .zshrc end"
echo -en "\r\033[K"
