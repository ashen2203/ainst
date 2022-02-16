#!/bin/bash

# basic commands to set the computer such as time and locales

ln -sf /usr/share/zoneinfo/Asia/Colombo /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archcat" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

# ROOT PASSWORD

echo root:1234 | chpasswd

# base packages including grub bootloader and some fonts 

pacman -S grub os-prober efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers linux-zen-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb cups alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync acpi acpi_call virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 iptables-nft firewalld flatpak sof-firmware nss-mdns acpid ntfs-3g terminus-font ttf-droid ttf-ubuntu-font-family noto-font-emoji ttf-dejavu noto-fonts ttf-roboto

# Nvidia driver

pacman -S --noconfirm nvidia nvidia-utils nvidia-settings nvidia-dkms

# Open-Source nvidia driver

# pacman -S xf86-video-nouveau

# Grub installation Commands

# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg

# Enabling Services

systemctl enable NetworkManager
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

# Creating a new user in the system with sudo and added to virtual machine management group

useradd -m ashen
echo ashen:1234 | chpasswd
usermod -aG libvirt ashen

echo "ashen ALL=(ALL) ALL" >> /etc/sudoers.d/ashen

#Ending the session as root, reboot into normal user and continue with DE setup.

printf "\e[1;32mDone! Type exit, umount -R /mnt and reboot.\e[0m"