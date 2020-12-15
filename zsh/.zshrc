#!/usr/bin/env zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc start\r\n"; fi

source <(antibody init)
antibody bundle < $ZDOTDIR/.zsh_plugins.txt

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Load the shell dotfiles, and then some:
# * ~/aliases/*.src can be used for setting aliases.
# * ~/functions/*.src can be used for implementing custom functions.
# * ~/extras/*.src can be used for anything else.for dir in $ZDOTDIR/{exports}; do
for dir in $ZDOTDIR/{aliases,functions,extra,plugins}; do
  if [ -d $dir ]; then
    for file in $dir/*.src; do
      [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
  fi
done


# Disable zsh's double check on rm with * argument
setopt rmstarsilent

# Load Custom Completions
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/completions/*.src

# Load Custom Configs
source $ZDOTDIR/config.zsh
source $ZDOTDIR/prompt.zsh

# echo -en "$(gdate +%s.%N) > load rvm\r\n"
# source "$HOME/.rvm/scripts/rvm"

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc end\r\n"; fi

if [ !$ZSH_DEBUG ]; then; clear; fi
