#!/usr/bin/env zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc start\r\n"; fi

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> initialize zinit\r\n"; fi
source ~/.zinit/bin/zinit.zsh

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Load the shell dotfiles, and then some:
# * ~/aliases/*.src can be used for setting aliases.
# * ~/functions/*.src can be used for implementing custom functions.
# * ~/extras/*.src can be used for anything else.for dir in $ZDOTDIR/{exports}; do
eval "$(/opt/homebrew/bin/brew shellenv)"
for dir in $ZDOTDIR/{aliases,exports,functions,extra,plugins}; do
  if [ -d $dir ]; then
    for file in $dir/*.src; do
      if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> source $file\r\n"; fi
      [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
  fi
done


# Disable zsh's double check on rm with * argument
setopt rmstarsilent

# Load Custom Completions
if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load custom completions\r\n"; fi
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/completions/*.src

# Load Custom Configs
if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load custom configs\r\n"; fi
source $ZDOTDIR/config.zsh
source $ZDOTDIR/prompt.zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load zinit config\r\n"; fi
source ~/.zinit/init.sh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc end\r\n"; fi

if [ !$ZSH_DEBUG ]; then; clear; fi
