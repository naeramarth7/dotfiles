# dotfiles

## Usage

### OS X Settings

The `.macos` script is for setting up OS X.
Check the lines for details and execute it to apply the settings:

```zsh
./.macos
```

### Homebrew

The `install.sh` script will:

* install Homebrew and Cask
* install Packages from Homebrew / Cask
* enable the [dotfiles](#usage-dotfiles)

### <a name="usage-dotfiles">dotfiles</a>

This step can be skipped when using the `install.sh` script, since it includes enabling the dotfiles.
If you however only want to include the dotfiles, make sure `rcm` is installed and run:

```zsh
# Change into repository folder
cd ~/dotfiles

# Run rcup with config from `rcrc` file
env RCRC=$(pwd -P)/rcrc rcup
```

## Disabling

### macOS Settings / Homebrew

Unfortunately, there's no possibilty to revert the changes made by the `.macos` script.
Fore removing Homebrew, see [superuser.com/a/203740](http://superuser.com/a/203740).

### dotfiles

To disable the included dotfiles, you can use `rcm`:

```zsh
# Change into repository folder
cd ~/dotfiles

# Remove symlinked files and folders from $HOME
rcdn
```

## Inspired by / Thanks to...

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Mike Coutermarsh](https://mikecoutermarsh.com/) and his [dotfiles](https://github.com/mscoutermarsh/dotfiles)

