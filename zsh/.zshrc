# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc start\r\n"; fi

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> initialize zinit\r\n"; fi

# Load the shell dotfiles, and then some:
# * ~/aliases/*.src can be used for setting aliases.
# * ~/functions/*.src can be used for implementing custom functions.
# * ~/extras/*.src can be used for anything else.for dir in $ZDOTDIR/{exports}; do
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

# Completions Settings
if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load custom completions\r\n"; fi
source $ZDOTDIR/completion.zsh

# Load Custom Configs
if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) >> load custom configs\r\n"; fi
source $ZDOTDIR/config.zsh
# source $ZDOTDIR/.prompt.sindresorhus.zsh

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

if $ZSH_DEBUG; then; echo -en "$(gdate +%s.%N) > .zshrc end\r\n"; fi
# if [ !$ZSH_DEBUG ]; then; clear; fi # not needed with p10k
