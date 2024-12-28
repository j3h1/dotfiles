# [Catalina Dots]([https://reddit.com/r/unixporn](https://www.reddit.com/r/unixporn/comments/1ho0fws/hyprland_posting_my_old_daily_driver_before/))

![Showcase](https://raw.githubusercontent.com/j3h1/dotfiles/refs/heads/main/Catalina%20Dots/SHOWCASE.mp4)

## Dependencies
```
hyprland eww wofi kitty fastfetch nwg-look btop swww
```
You can install them with `yay` or `paru`.
## How to install
1. Make sure [dependencies](#Dependencies) are properly installed.
2. Clone repository to home directory with the commands
```
cd ~
git clone https://github.com/j3h1/dotfiles
```
3. Copy files to the corresponding directory with the commands
```
cp -r ~/dotfiles/Catalina\ Dots/.config/* ~/.config
cp ~/dotfiles/Catalina\ Dots/Catalina.jpg ~
cp ~/dotfiles/Catalina\ Dots/.bashrc ~
```
4. Set wallpaper with the command
```
sww img ~/Catalina.jpg
```
6. You can now safely remove the dotfiles repo
```
rm -r ~/dotfiles
```
6. `reboot` and enjoy!
