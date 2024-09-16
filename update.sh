read -p "user: " user

cp -r /home/$user/.config/nvim .
cp /home/$user/.bashrc .
cp /home/$user/.config/picom/picom.conf ./scripts/system/files/picom
cp -r /etc/systemd/network ./scripts/system/files
cp -r /home/$user/.config/i3 .
