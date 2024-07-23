# Configuration for zsh

## Requirements

In order to run this configuration we need to install:

- alacritty
- starship
- neovim
- fzf
- zoxide
- ripgrep
- stow
- node (preferably with nvm)
- a nerd font (jetbrains mono nerd font suggested)
- tmux
- tmux plugin manager (tpm)
- lazygit

```bash
# on macOS
brew install alacritty
brew install starship
brew install fzf
brew install neovim
brew install zoxide
brew install ripgrep
brew install stow
brew install nvm
brew search '/font-.*jetbrains.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
nvm install 18 # or any other version
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install lazygit
```

## Usage

Once dependencies are installed we can clone this repository and move into the directory an run:

```bash
stow .

# start a new tmux session
tmux new -s my-session-name
tmux source ~/.tmux.conf
# install tmux plugins by pressing `prefix` + `I` (capitial i, as install)
# in this configuration `prefix = C-a`
```
