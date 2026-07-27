#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# TEXT MODIFIERS
# ==========================================
NC='\033[0m'        
BOLD='\033[1m'       
DIM='\033[2m'         
UNDERLINE='\033[4m'    
BLINK='\033[5m'         
REVERSE='\033[7m'        
HIDDEN='\033[8m'          
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
B_BLACK='\033[1;30m'
B_RED='\033[1;31m'
B_GREEN='\033[1;32m'
B_YELLOW='\033[1;33m'
B_BLUE='\033[1;34m'
B_PURPLE='\033[1;35m'
B_CYAN='\033[1;36m'
B_WHITE='\033[1;37m'

# Helpers
arrowed_prompt() { echo -e "${B_GREEN}==> ${NC} $1"; }
REPO_URL="https://github.com/mrunknown850/arch-dotfile"


printf "${UNDERLINE}${GREEN}=== MrUnknown850's Arch Linux post-install script ===${NC}"

arrowed_prompt "Setting up zsh shell."
sudo chsh -s /usr/bin/zsh $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

arrowed_prompt "Setting up dotfiles."
git clone $REPO_URL ~/.dotfiles
cd ~/.dotfiles
mkdir ~/.config
stow -S --adopt configurations

arrowed_prompt "Generating color scheme."
matugen image ./image/wallpaper.jpg -m dark

arrowed_prompt "Enabling system services."
# sudo systemctl enable --now apparmor.service
# sudo systemctl enable --now auditd.service
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now cronie.service
sudo systemctl enable --now cups.service
sudo systemctl enable --now iwd.service
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now reflector.service
sudo systemctl enable --now tlp.service

arrowed_prompt "Enabling user services."
systemctl --user enable --now batsignal.service
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now wireplumber.service
systemctl --user enable --now xdg-user-dirs.service

# Front facing
systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now mako.service

# Post graphical
systemctl --user enable waybar.service
systemctl --user enable cliphist.service

arrowed_prompt "Setting up login."
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf > /dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USER --noclear %I $TERM
EOF

arrowed_prompt "Installing AUR tools."
cd ~ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm
cd ~ && rm -rf ./yay-bin

arrowed_prompt "Post-installation finished!"
printf "mrunknown850's dotfile has been successfully deployed onto your system.
Reboot to enter `hyprland`. If any issue occured during the installation process
or routine operations, submit an ${BOLD}Issue${NC} on the github repository.
-- ${UNDERLINE} $REPO_URL ${NC}
"
printf "${WHITE}Press ${BOLD}Enter${WHITE} to ${BOLD}reboot...${NC}"
read 


