# dotfiles

Personal configuration files for running a stylish Arch Linux desktop environment

## Essential packages list
- Window Manager: bspwm
- Task Bar: polybar
- Launcher: rofi
- Compositor: picom
- Terminal: alacritty
- GUI File Manager: thunar
- Email Client: thunderbird
- Calander: gnome-calendar
- Lockscreen: betterlockscreen (compile dependencies + repo from https://github.com/betterlockscreen/betterlockscreen#how-it-works)
    - Regenerate lockscreen images with `betterlockscreen -u <path-to-image>`

## Nice-to-haves
- System Info Fetcher: neofetch
- Audio Visualizer: cava
- Terminal File Manager: ranger
- Terminal Multiplexer: tmux
- Matrix Screensaver: cmatrix

## Installation
- Install essential packages using your distro's package manager (may be one of `apt`, `pacman`, `dnf`, etc...)
- Install themes, fonts, and icons by moving their unzipped folders into `~/usr/share/themes, fonts, icons` respectively
- Run the `create_links.sh` script to apply the configs

## Useful features
- Email and calendar clients launches on bspwm start-up and are sent to desktops 3, 6 respectively
- `super + alt + {1-3}` switches workspaces on both monitors and retains focus on current monitor
- `super + tab` switches focus between monitors

## Notes
- Monitor settings are handled with `xrandr` in `~/.config/bspwm/bspwmrc`
- Start-up applications and other initialization are handled in `~/.config/.bspwm/start-apps`

![snapshot_0](images/snapshot_0.png)
![snapshot_1](images/snapshot_1.png)
