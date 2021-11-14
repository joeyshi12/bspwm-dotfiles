#!/bin/bash

dir="$HOME/Workspace/dotfiles"

# Install vim-plug (https://github.com/junegunn/vim-plug#installation)
cp -r $dir/.vim ~

# Install themes, fonts, icons
theme_dir="$HOME/.local/share/themes"
font_dir="$HOME/.local/share/fonts"
icon_dir="$HOME/.local/share/icons"

if [[ ! -d "$theme_dir" ]]; then mkdir -p $theme_dir; fi
if [[ ! -d "$font_dir" ]]; then mkdir -p $font_dir; fi
if [[ ! -d "$icon_dir" ]]; then mkdir -p $icon_dir; fi

for theme in $(ls $dir/.themes); do tar -xf $dir/.themes/$theme -C $theme_dir; done
for font in $(ls $dir/.fonts); do tar -xf $dir/.fonts/$font -C $font_dir; done
for icon in $(ls $dir/.icons); do tar -xf $dir/.icons/$icon -C $icon_dir; done

# Create links
dotfiles=(
    ".config/alacritty"
    ".config/bspwm"
    ".config/cava"
    ".config/dunst"
    ".config/gtk-3.0"
    ".config/ranger"
    ".config/betterlockscreenrc"
    ".zshrc"
    ".zsh_aliases"
    ".vimrc"
    ".tmux.conf"
    ".xinitrc"
    ".Xresources"
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
