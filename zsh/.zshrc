#!/usr/bin/env zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc start\r\n"; fi

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Disable zsh's double check on rm with * argument
setopt rmstarsilent

# Load Plugins

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load plugins\r\n"; fi
source $ZDOTDIR/plugins/zgen.src
source $ZDOTDIR/plugins/lazy.src
source $ZDOTDIR/plugins/fasd.src

# echo -en "$(gdate +%s.%N) > load rvm\r\n"
source "$HOME/.rvm/scripts/rvm"

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > load nvm\r\n"; fi
source "$BREW_NVM_DIR/nvm.sh" --no-use

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc end\r\n"; fi

if [ !$ZSH_DEBUG ]; then; clear; fi
