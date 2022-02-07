# dotfiles

Personal configuration files for running a stylish Arch Linux desktop environment

## Table of contents
- [Rice info](#rice-info)
- [Installation](#installation)
- [Window management tips](#window-management-tips)
- [Monitor settings](#monitor-settings)
- [Network settings](#network-settings)
- [Bluetooth settings](#bluetooth-settings)
- [Audio settings](#audio-settings)

|HDMI-0|DVI-I-1|   
|-|-|
|![img](images/snapshot_2.png)|![img](images/snapshot_3.png)|


## Rice info
- Window Manager: bspwm
- Display Manager: lightdm
- Task Bar: polybar
- Launcher: rofi
- Compositor: picom (requires a version with rounded corner support)
    - Arch: https://aur.archlinux.org/packages/picom-rounded-corners/
    - Ubuntu: https://github.com/yshui/picom/
- Terminal: alacritty
- File Manager: thunar
    - `gvfs` required for usb devices
    - `xarchiver` required for creating and extracting zip files
- Email Client: thunderbird
- Lockscreen: betterlockscreen (https://github.com/betterlockscreen/betterlockscreen#how-it-works)
    - Regenerate lockscreen images with `betterlockscreen -u <path-to-image>`

## Installation
- Bulk install native packages from pkglist with your package manager (e.g. `apt`, `pacman`, `dnf`).
    - Can simply use `<install-cmd> $(cat pkglist)` (e.g. `pacman -S $(cat pkglist)`)
- Install community packages from pkglocallist
    - You can use an external package manager like `yay` on Arch
- Install themes, fonts, icons, and dotfiles by running `./install.sh`
- Install additional themes, fonts, and icons by moving their unzipped folders into `~/usr/share/themes, fonts, icons` respectively
    - Fonts for the terminal: `npm install git://github.com/adobe-fonts/source-code-pro.git#release`  (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)
    - Fonts for Steam (in case of text-rendering bugs): `pacman -S ttf-liberation`
    - `fc-cache -v` to reload font cache

## Window management tips
- `super` is the windows key on your keyboard
- `super + {1-6}` will jump to the inputted workspace number (workspace distribution is given in `.config/bspwm/bspwmrc`)
- `super + alt + {1-3}`: if `n` is the inputted number, then will move workspaces on both monitors to the `n-th` workspace from the left
- `super + w` close focused window
- `super + {h,j,k,l}` moves the focus on other windows
- `super + shift + {h,j,k,l}` moves the focused window
- More details can be found in `.config/bspwm/sxhkd/sxhkdrc`

## Monitor settings
- Monitor orientation and resolution settings can be configured in `/etc/X11/xorg.conf.d/52-resolution-fix.conf`
```
Section "Monitor"
    Identifier "HDMI-0"
    Option "PreferredMode" "2560x1440"
    Option "Primary" "1"
EndSection
Section "Monitor"
    Identifier "DVI-I-1"
    Option "PreferredMode" "1920x1080"
    Option "RightOf" "HDMI-0"
EndSection
```
- Workspace allocation across monitors is configured in `~/.config/bspwm/bspwmrc`
- View available monitors and resolutions by running `xrandr`

## Network settings
- Packages: `NetworkManager` (check to make sure this is installed)
- Run `nmcli dev wifi` to scan for networks
- Run `nmtui` to open user interface for connecting to networks

## Bluetooth settings
- Packages: `bluz bluez-utils`
- Enable bluetooth service `systemctl enable bluetooth.service`
- Power on bluetooth adapter on start:
    - Add `AutoEnable=true` under the `[Policy]` section of `/etc/bluetooth/main.conf`
- Scan for bluetooth devices with `bluetoothctl scan on` and connect using `connect <device-address>`

## Audio settings
- Packages: `pulseaudio-alsa pulseaudio-bluetooth bluetooth-autoconnect pavucontrol`
- Pavucontrol is a gui audio mixer
- bluetooth-autoconnect is a script for connecting to trusted devices automatically
    - Run `bluetooth-autoconnect` to connect devices
    - `systemctl enable bluetooth-autoconnect` to run autoconnect command on start-up
