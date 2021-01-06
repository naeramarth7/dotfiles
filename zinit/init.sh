#!/usr/bin/env zsh

setopt promptsubst

zinit wait'!' lucid for \
  OMZL::prompt_info_functions.zsh \
  sindresorhus/pure

zinit wait lucid for \
  mafredri/zsh-async \
  Tarrasch/zsh-autoenv \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  zsh-users/zsh-history-substring-search

# Download plugins with svn (whole folder)
zinit wait lucid svn for \
  OMZP::gitfast

zinit wait lucid for \
  zdharma/fast-syntax-highlighting

zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
    zdharma/fast-syntax-highlighting
