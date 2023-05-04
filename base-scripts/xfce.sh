#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies firefox-developer-edition arc-gtk-theme arc-icon-theme 

sudo systemctl enable lightdm

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"

sleep 5
sudo reboot
