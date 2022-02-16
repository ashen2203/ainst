# Setup time

sudo timedatectl set-ntp true
sudo hwclock --systohc

# Setup firefall

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

#Setup pikaur aur helper

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm

#Installing personal programs

sudo pacman -S --noconfirm papirus-icon-theme kwrite ark firefox simplescreenrecorder arc-gtk-theme arc-icon-theme obs-studio vlc libreoffice-still gparted evince htop nvtop gwenview mpv qbittorrent

# sudo flatpak install -y spotify

# pikaur -S brave-bin

# vscodium-bin