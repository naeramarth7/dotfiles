# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:/usr/local/sbin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/path/*.src can be used to extend `$PATH`.
# * ~/extra/*.src can be used for other settings you don’t want to commit.
for dir in ~/.{path,exports,aliases,functions,extra}; do
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

