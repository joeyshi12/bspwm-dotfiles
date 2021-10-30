#!/bin/bash

dir="$HOME/Workspace/dotfiles"

# Handles creating a link file for $1 targetting $2
# $1 source path
# $2 target path
create_link() {
    if [[ -e "$2" ]]; then
        echo "$2 exists. Replace? (y/n)"
        read ans
        if [[ $ans == "y" ]]; then
            rm -r $2
            echo "deleted $2"
        else
            return
        fi
    fi
    ln -s $1 $2
}

# Link configs
for item in $(ls $dir/.config); do
    create_link $dir/.config/$item ~/.config/$item
done

# Link profile
create_link $dir/.profile ~/.profile

# Link Xresources
create_link $dir/.Xresources ~/.Xresources

# Link vimrc
create_link $dir/.vimrc ~/.vimrc

# Link tmux.conf
create_link $dir/.tmux.conf ~/.tmux.conf

# Link bashrc
create_link $dir/.bashrc ~/.bashrc
create_link $dir/.bash_aliases ~/.bash_aliases

