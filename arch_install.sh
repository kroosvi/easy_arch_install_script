ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

#system
pacman -S networkmanager rsync dialog wpa_supplicant mtools base-devel
pacman -S dosfstools linux-headers xdg-utils curl ranger
pacman -S flameshot pulseaudio lxappearance sshd  lightdm
pacman -S alsa-utils nvidia nvidia-utils nvidia-settings refind fish firefox

#your own applications
pacman -S i3 alacritty rofi discord unzip p7zip dunst feh

refind-install 

systemctl enable sshd
systemctl enable bluetooth
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable pulseaudio

#add user and passwd
useradd -m kroozy
echo kroozy:password | chpasswd
usermod -G wheel kroozy
echo "kroozy ALL=(ALL) ALL" >> /etc/sudoers.d/kroozy

printf "\e[1;32m Please add another boot loader Then Type exit, umount -a and reboot.\e[0m"
