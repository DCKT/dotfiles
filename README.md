# Dotfiles

## Requirements

1. [Wezterm](https://wezfurlong.org/wezterm/index.html) terminal
2. [GNU Stow](https://www.gnu.org/software/stow/)
3. [Neovim](https://neovim.io/) : btw
4. [Aerospace](https://github.com/nikitabobko/AeroSpace) tiling window manager
5. [Sketchybar](https://felixkratz.github.io/SketchyBar/) : custom menu bar
6. [Himalaya](https://github.com/pimalaya/himalaya) : CLI email client
7. [Starship](https://starship.rs/) : Cross-shell prompt
8. [https://meetingbar.app/](meetingbar): Meeting app + apple shortcuts

## Setup

1. Clone this repo.
2. Install all the requirements
3. Run the stow command
4. Append the alias file to `.zshrc`

```bash
source "$HOME/.zshrc_alias"
```

```sh
stow .
```
