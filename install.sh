#!/bin/bash

dir="$HOME/dotfiles"

# Install themes, fonts, icons
theme_dir="$HOME/.local/share/themes"
font_dir="$HOME/.local/share/fonts"
icon_dir="$HOME/.local/share/icons"

[[ -d "$theme_dir" ]] || mkdir -p $theme_dir
[[ -d "$font_dir" ]] || mkdir -p $font_dir
[[ -d "$icon_dir" ]] || mkdir -p $icon_dir

for theme in $(ls $dir/.themes); do tar -xf $dir/.themes/$theme -C $theme_dir; done
for font in $(ls $dir/.fonts); do tar -xf $dir/.fonts/$font -C $font_dir; done
for icon in $(ls $dir/.icons); do tar -xf $dir/.icons/$icon -C $icon_dir; done

# Create links
dotfiles=(
    ".config/alacritty"
    ".config/bspwm"
    ".config/picom"
    ".config/cava"
    ".config/gtk-3.0"
    ".config/nvim"
    ".config/ranger"
    ".config/betterlockscreenrc"
    ".config/tmux"
    ".zprofile"
    ".zshrc"
    ".aliases.zsh"
    ".xinitrc"
    ".pylintrc"
    ".sqliterc"
)

for file in "${dotfiles[@]}"; do
    source="$dir/$file"
    target="$HOME/$file"

    if [[ -e "$target" ]]; then
        echo "$target exists. Replace? (y/n)"
        read ans
        if [[ $ans == "y" ]]; then
            rm -r $target
            echo "replaced $target"
        else
            echo "skipping $file"
            continue
        fi
    fi

    ln -s $source $target
done
