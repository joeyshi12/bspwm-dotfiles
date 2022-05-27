#!/bin/bash

DOTFILES_DIR=~/.dotfiles

# Install themes, fonts, icons
for asset_type in themes fonts icons; do
    archive_dir=$DOTFILES_DIR/assets/$asset_type
    local_asset_dir=$HOME/.local/share/$asset_type

    [ -d "$local_asset_dir" ] || mkdir -p "$local_asset_dir"
    for archive in $(ls $archive_dir); do
        tar -xf "$archive_dir/$archive" -C "$local_asset_dir"
    done
done

# Create links
dotfiles=(
    ".config/alacritty"
    ".config/bspwm"
    ".config/picom"
    ".config/cava"
    ".config/gtk-2.0"
    ".config/gtk-3.0"
    ".config/nvim"
    ".config/ranger"
    ".config/betterlockscreenrc"
    ".config/tmux"
    ".config/sqlite3"
    ".config/conda"
    ".config/pylintrc"
    ".zprofile"
    ".zshrc"
    ".xinitrc"
)

for file in "${dotfiles[@]}"; do
    ln -sfn "${DOTFILES_DIR}/${file}" "${HOME}/$file"
done
