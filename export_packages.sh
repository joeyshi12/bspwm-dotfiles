#!/bin/bash

# creates list of all installed packages
# reinstall with pacman -S $(cat pkglist)

# Export list of native packages
pacman -Qqen > pkglist

# Export list of foreign packages (includes AUR and locally installed)
pacman -Qqem > pkglocallist
