#!/usr/bin/env zsh

# Load antigen
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

# Set antigen bundles
#antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle rupa/z

# No theme applied. Airline used for this. See functions/airline

antigen-apply

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/svenflickinger/.travis/travis.sh ] && source /Users/svenflickinger/.travis/travis.sh
