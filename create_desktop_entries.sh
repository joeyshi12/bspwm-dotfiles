#!/bin/bash

# Creates desktop entries for all home folders

dir=~/.local/share/applications/home_folders
[ -d $dir ] || mkdir -p $dir
rm -rf $dir/*

# Outputs content of desktop entry for a given home folder
# $1 is the home folder name
desktop_entry() {
cat <<EOF
[Desktop Entry]
Name=$1
Exec=thunar $1
Icon=org.xfce.thunar
Terminal=false
Type=Application
Categories=System;Utility;Core;GTK;FileTools;FileManager;
EOF
}

for file in $(ls "$HOME"); do
    if [ -d "$HOME/$file" ]; then
        desktop_entry $file > $dir/$file.desktop
    fi
done
