# Configuration for zsh

## Requirements

In order to run this configuration we need to install:

- alacritty
- neovim
- fzf
- zoxide
- ripgrep
- stow
- node (preferably with nvm)
- a nerd font (jetbrains mono nerd font suggested)

```bash
# on macOS
brew install alacritty
brew install fzf
brew install neovim
brew install zoxide
brew install ripgrep
brew install stow
brew install nvm
brew search '/font-.*jetbrains.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
nvm install 18 # or any other version
```

## Usage

Once dependencies are installed we can clone this repository and move into the directory an run:

```bash
stow .
```
