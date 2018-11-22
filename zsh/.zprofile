#!/usr/bin/env zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zprofile start\r\n"; fi

# Load the shell dotfiles, and then some:
# * ~/exports/*.src can be used for extending `$PATH` or addding env variables.
# * ~/aliases/*.src can be used for setting aliases.
# * ~/aliases/*.src can be used for implementing custom functions.
# * ~/extras/*.src can be used for anything else.
for dir in $ZDOTDIR/{exports,aliases,functions,extra,plugins}; do
  if [ -d $dir ]; then
    for file in $dir/*.src; do
      [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
  fi
done
unset dir
unset file

# Bind Alt+LeftArrow and Alt+RightArrow
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Add all ssh keys from keychain
ssh-add -A 2>/dev/null

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zprofile end\r\n"; fi
