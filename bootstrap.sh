#!/bin/bash

DOTFILES_DIR="${HOME}/.dotfiles"
DOTFILES=(
    ".config/bspwm"
    ".config/kitty"
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
    ".config/ripgrep"
    ".config/coc/extensions/package.json"
    ".zprofile"
    ".zshrc"
    ".xinitrc"
)

# Install themes, fonts, icons
for asset_type in themes fonts icons; do
    archive_dir="${DOTFILES_DIR}/assets/${asset_type}"
    local_asset_dir="${HOME}/.local/share/${asset_type}"

    mkdir -p ${local_asset_dir}
    for archive in $(ls "${archive_dir}"); do
        tar -xf "${archive_dir}/${archive}" -C "${local_asset_dir}"
    done
done

# Create links
for file in "${DOTFILES[@]}"; do
    mkdir -p $(dirname "${HOME}/${file}")
    ln -sfn "${DOTFILES_DIR}/${file}" "${HOME}/${file}"
done
