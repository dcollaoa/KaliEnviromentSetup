#!/bin/bash

# Update repositories and install updates
sudo apt update
sudo apt upgrade -y

sudo apt install timg -y

########################VSCODE################################
# Download and install Microsoft GPG key for VSCode repository
sudo apt install curl gpg gnupg2 software-properties-common apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update && sudo apt install code
# Clean up temporary files
rm -f microsoft.gpg
##############################################################

##########################RCLONE##############################
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone
sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb
cd ../
rm -rf rclone-v1.66.0-linux-amd64
rm -rf rclone-current-linux-amd64.zip
#rclone config 
##############################################################

# Permisos para el usuario kali en el archivo target
sudo chown kali:kali /home/kali/.config/bin/target

#Spanish Keyboard Fix
sudo echo "setxkbmap es" >> ~/.zshrc

# Notify when installation is complete
notify-send "Installation complete. Your environment is ready."

# Exit the script
exit 0
