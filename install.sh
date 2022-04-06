#!/bin/bash

dir=$(pwd)

# Install themes, fonts, icons
theme_dir="${HOME}/.local/share/themes"
font_dir="${HOME}/.local/share/fonts"
icon_dir="${HOME}/.local/share/icons"

[ -d "$theme_dir" ] || mkdir -p $theme_dir
[ -d "$font_dir" ] || mkdir -p $font_dir
[ -d "$icon_dir" ] || mkdir -p $icon_dir

for theme in $(ls $dir/.themes); do
    tar -xf $dir/.themes/$theme -C $theme_dir
done

for font in $(ls $dir/.fonts); do
    tar -xf $dir/.fonts/$font -C $font_dir
done

for icon in $(ls $dir/.icons); do
    tar -xf $dir/.icons/$icon -C $icon_dir
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
    ".aliases.zsh"
    ".xinitrc"
)

for file in "${dotfiles[@]}"; do
    target="${dir}/${file}"
    link_name="${HOME}/${file}"

    if [ -e "$link_name" ]; then
        echo "${link_name} exists. Replace? (y/n)"
        read ans
        if [ $ans == "y" ]; then
            rm -r $link_name
            echo "replaced ${link_name}"
        else
            echo "skipping ${file}"
            continue
        fi
    fi

    ln -s $target $link_name
done
