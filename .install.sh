timedatectl set-ntp true

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
 
hwclock --systohc
 
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

pacman -S --noconfirm nvidia nvidia-utils nvidia-settings refind dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers xdg-utils
pacman -S --noconfire rsync 
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable avahi-daemon


useradd -m kroos
usermod -aG wheel kroos

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
