#!/usr/bin/env zsh

echo -en "$(gdate +%s.%N) > .zshrc start\r\n"

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Disable zsh's double check on rm with * argument
setopt rmstarsilent

# Load Plugins

echo -en "$(gdate +%s.%N) >> load plugins\r\n"
source $ZDOTDIR/plugins/zgen.src
source $ZDOTDIR/plugins/lazy.src
source $ZDOTDIR/plugins/fasd.src

# echo -en "$(gdate +%s.%N) > load rvm\r\n"
# source "$HOME/.rvm/scripts/rvm" --no-use

echo -en "$(gdate +%s.%N) > load nvm\r\n"
source "$BREW_NVM_DIR/nvm.sh" --no-use

echo -en "$(gdate +%s.%N) > .zshrc end\r\n"

# clear
