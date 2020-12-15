#!/usr/bin/env zsh

# DIR to oh-my-zsh
ZSH="${HOME}/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

ZDOTDIR="$HOME/.zsh"
. $ZDOTDIR/.zshenv
if [ -e /Users/svenf/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/svenf/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
