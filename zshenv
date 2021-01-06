#!/usr/bin/env zsh

ZDOTDIR="$HOME/.zsh"
. $ZDOTDIR/.zshenv

# added by Nix installer
if [ -e /Users/svenf/.nix-profile/etc/profile.d/nix.sh ]; then
  . /Users/svenf/.nix-profile/etc/profile.d/nix.sh
fi
