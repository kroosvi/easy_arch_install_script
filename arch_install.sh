timedatectl set-ntp true

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
 
hwclock --systohc
 
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "arch" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

pacman -S --noconfirm reflector
reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist

pacman -S --noconfirm rsync nvidia nvidia-utils nvidia-settings
pacman -S --noconfirm refind dialog wpa_supplicant mtools dosfstools  base-devel linux-headers xdg-utils curl

pacman -S --noconfirm ranger nvim i3 polybar alacritty zsh discord flameshot firefox pulseaudio lxappearance 
pacman -S --noconfirm yay


systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable NetworkManager


useradd -m kroos
usermod -aG wheel kroos

printf "\e[1;32mDone! Add a passwrod! Type exit, umount -a and reboot.\e[0m"
