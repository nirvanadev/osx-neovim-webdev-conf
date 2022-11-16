# Neovim Setup for Web/PHP Development

## Prerequisites
- If you have a custom vim setup, you may want to create a backup of those files and move/remove them, so they aren't seen accidentally by your new neovim setup.
- This is my setup on OSX. You may need to modify the config for other *nix based OS's.

## Requirements
- NodeJS (v16 was used when creating this repo)

## Install
1. Install vim-plug or your preferred plugin manager
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
2. Create the config directory `~/.config/nvim/`.
3. Clone this repo into the config folder.
```
git clone some_repo ./
```
4. Start neovim for the first time and install plugins.
```
nvim +PlugInstall
```
