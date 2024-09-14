# Script to install keyd and set its configuration
pacman -S keyd

# Set keyd
 cp ./files/keyd/default.conf /etc/keyd/default.conf

 systemctl enable keyd
 systemctl start keyd
