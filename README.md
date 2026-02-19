# dotfiles

## Setup

### Prerequisites

Can be bootstrapped via [nixfiles](https://github.com/naeramarth7/nixfiles).

- [chezmoi](https://www.chezmoi.io/install/)
- [1Password](https://1password.com/downloads/)

### Linux / macOS

```sh
mkdir -p ~/.local/share
git clone https://github.com/naeramarth7/dotfiles ~/.local/share/chezmoi
chezmoi init --apply
```
