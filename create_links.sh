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

# Link xinitrc
create_link $dir/.Xresources ~/.Xresources
create_link $dir/.xinitrc ~/.xinitrc

# Link vimrc
create_link $dir/.vimrc ~/.vimrc

# Link tmux.conf
create_link $dir/.tmux.conf ~/.tmux.conf

# Link shell config
if [[ $SHELL == "/bin/zsh" ]]; then
    create_link $dir/.zshrc ~/.zshrc
    create_link $dir/.aliases ~/.zsh_aliases
else
    create_link $dir/.bashrc ~/.bashrc
    create_link $dir/.aliases ~/.bash_aliases
fi
