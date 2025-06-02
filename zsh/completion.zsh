#!/bin/zsh

# Add completions from packages installed with brew
# See: https://github.com/github/hub/issues/904
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fpath=(/Users/sven.herrle/.zsh/completions $fpath)

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# The following lines were added by compinstall

zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/sven.herrle/dotfiles/zsh/completion.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall

