#!/usr/bin/env zsh

# Load antigen
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

# Set antigen bundles
# #antigen bundle git
antigen-bundles <<EOBUNDLES
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
# kennethreitz/autoenv
rupa/z
EOBUNDLES

# No theme applied. Airline used for this. See functions/airline
antigen theme miloshadzic

antigen-apply

# added by travis gem
# [ -f /Users/svenflickinger/.travis/travis.sh ] && source /Users/svenflickinger/.travis/travis.sh
