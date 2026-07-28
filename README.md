<div align="center">
  <h1>MrUnknown850's dotfile</h1>
  <h3>Simple - Minimal - Practical</h3>
</div>

> [!IMPORTANT]
> Hyprland 0.55 and above only: Due to the recent deprecation of Hyprlang, it is required that you update to Hyprland 0.55 and above. For distributions that have not shipped the needed version, consider building Hyprland from [source](https://github.com/hyprwm/hyprland).

## Screenshots
![Preview_1](./.github/preview_1.png)
![Preview_2](./.github/preview_2.png)
![Preview_3](./.github/preview_3.png)

## 0. Table of content
## 1. What is it?
Configuration files that happens to come with automated system setup script. Utilising [archinstall](https://wiki.archlinux.org/title/Archinstall), a fully battery-packed system can be deployed with minimal user interaction.
> [!WARNING]
> The current setup is very crude. Despite the simple setup process, the use of terminal is still required for deeper customisation.

What's included?
- System pacmages: pipewire, ufw, bluetooth, tlp,...
- Hypr* suite.
- Material 3 design with color scheme generated from [matugen](https://github.com/InioX/matugen)

| Category | App | Category | App |
|:--- |:--- |:--- |:--- |
| Shell | zsh | WM | Hyprland |
| Editor | neovim | Terminal | kitty |
| Launcher | rofi | Statusbar | waybar |
| File Manager | nautilus | Notification Daemon | mako |

## 2. Installation
> [!NOTE]
> This step is for installing Arch Linux from the dotfile's configuration file. If you already have a working system, skip to step 3.
1. Prepare and boot up the [Arch Linux image](https://archlinux.org/download/).
2. Run
```bash
> bash <(curl -sL https://raw.githubusercontent.com/mrunknown850/arch-dotfile/master/install.sh)
```
3. Reboot and run this in a terminal.
```bash
> bash <(curl -sL https://raw.githubusercontent.com/mrunknown850/arch-dotfile/master/install-post.sh)
```

## 3. Credits
- Source for the default [wallpaper](./image/wallpaper.jpg): https://unsplash.com/photos/aerial-photography-of-mountain-range-covered-with-snow-under-white-and-blue-sky-at-daytime-9wg5jCEPBsw

Copyright (c) 2026 MrUnknown850. All Rights Reserved.
