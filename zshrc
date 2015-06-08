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

antigen theme sorin

antigen-apply

# Load nvm
source $(brew --prefix nvm)/nvm.sh

# Load powerline plugin
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
