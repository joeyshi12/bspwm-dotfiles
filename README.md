# dotfiles

Configuration files for running a stylish Linux desktop environment

## Essential packages list
- Window Manager: bspwm
- Task Bar: polybar
- Launcher: rofi
- Compositor: picom (compile from repository https://github.com/yshui/picom)
- Terminal: alacritty
- GUI File Manager: thunar
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
- Run the `create_links.sh` script to apply the configs

## Useful features
- Email and calendar clients launches on bspwm start-up and are sent to desktops 3, 6 respectively
- `super + alt + {1-3}` switches workspaces on both monitors and retains focus on current monitor
- `super + tab` switches focus between monitors

## Notes
- Monitor settings are handled with `xrandr` in `~/.config/bspwm/bspwmrc`
- Start-up applications and other initialization are handled in `~/.config/.bspwm/start-apps`

![aurora_snapshot_0](https://user-images.githubusercontent.com/46363213/137676878-387c8ac1-02e5-4858-b7dc-16a98bdf6e66.png)
![aurora_snapshot_1](https://user-images.githubusercontent.com/46363213/137676883-bcaee77a-c1ed-46c9-bbf5-1b64d2d619b9.png)
