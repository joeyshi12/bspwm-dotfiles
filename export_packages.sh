#!/bin/bash

# creates list of all installed packages
# reinstall with pacman -S $(cat pkglist)

pacman -Qqet | grep -v "$(pacman -Qqm)" > pkglist

# A list of local packages (includes AUR and locally installed)
pacman -Qm > pkglocallist

