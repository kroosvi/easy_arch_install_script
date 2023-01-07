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



pacman -S --noconfirm rsync nvidia nvidia-utils nvidia-settings refind
pacman -S --noconfirm dialog wpa_supplicant mtools dosfstools  base-devel linux-headers xdg-utils curl
pacman -S --noconfirm ranger nvim polybar fish discord flameshot firefox pulseaudio lxappearance sshd gdm

pacman -S pacman -S sway i3status swayidle swaylock alacritty rofi 



systemctl enable sshd
systemctl enable gdm.service
systemctl enable NetworkManager


useradd -m kroozy
usermod -aG wheel sudo kroozy

printf "\e[1;32mDone! Add a passwrod! Type exit, umount -a and reboot.\e[0m"
