ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

#best mirrorlist for USA
pacman -S reflector
reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist


#system
pacman -S networkmanager rsync dialog wpa_supplicant mtools 
pacman -S dosfstools base-devel linux-headers xdg-utils curl ranger 
pacman -S flameshot pulseaudio lxappearance sshd  lightdm
pacman -S alsa-utils nvidia nvidia-utils nvidia-settings refind conky fish firefox

# your own 
pacman -S awesome alacritty rofi discord 

refind-install 

systemctl enable sshd
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable pulseaudio


useradd -m kroozy
usermod -G wheel kroozy

printf "\e[1;32mDone! Add a passwrod! Type exit, umount -a and reboot.\e[0m"
