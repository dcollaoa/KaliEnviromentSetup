#!/bin/bash
#Created by 3ky

# Update repositories and upgrade installed packages
sudo apt update
sudo apt upgrade -y

# Install necessary packages for image display and Visual Studio Code
sudo apt install timg -y # Timg to display image files in Terminal

# Install dependencies for VSCode installation
sudo apt install curl gpg gnupg2 software-properties-common apt-transport-https -y
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install code -y # Install VS Code
rm -f microsoft.gpg # Clean up temporary files

# Install rclone for cloud storage synchronization
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
rm -rf rclone-*-linux-amd64
rm rclone-current-linux-amd64.zip
#rclone config

# Install and configure BloodHound
sudo apt install openjdk-11-jdk -y # Installing JAVA (requirements)
sudo apt install neo4j -y # Install Neo4j
sudo neo4j console # Start Neo4j service
cd ~/Downloads
wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip
unzip -q BloodHound-linux-x64.zip
sudo mv BloodHound-linux-x64 /bin/bloodhound
cd /bin/bloodhound
./BloodHound --no-sandbox # Start BloodHound
echo "alias bloodhound='/bin/bloodhound/BloodHound'" >> ~/.zshrc # Add alias to .zshrc

# Install dirsearch from repositories
sudo apt install dirsearch -y # Deprecated but still working as of 11/05/2024

# Install PowerShell
sudo apt-get update
sudo apt-get install -y wget
source /etc/os-release
wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
pwsh
exit
# Error fix for Kali Linux: use runtime dependencies for dotnet 6.0 not 7.0
sudo apt install dotnet-runtime-deps-6.0
sudo apt install mono-complete

# Install NetExec
sudo apt install pipx git
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

# Install ligolo-ng
cd ~/Downloads/
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_proxy_0.5.2_linux_amd64.tar.gz
7z x ligolo-ng_agent_0.5.2_linux_amd64.tar.gz
7z x ligolo-ng_agent_0.5.2_linux_amd64.tar
7z x ligolo-ng_proxy_0.5.2_linux_amd64.tar.gz 
7z x ligolo-ng_proxy_0.5.2_linux_amd64.tar
rm -rf ligolo-* README.md LICENSE
mkdir ~Tools/ligolo-ng
mv * ~/Tools/ligolo-ng

# Download SecLists of course
sudo apt install seclists

# Fix VMware guest tools installation
sudo apt update
sudo apt install -y --reinstall open-vm-tools-desktop fuse3
sudo reboot -f
kali-tweaks # Choose virtualization -> install additional packages and scripts for VMware
sudo mount-shared-folders
sudo restart-vm-tools

#When you use 'sudo kill -9 -1' you disable VMware guest tools 
#This is the fix
sudo systemctl restart vmtoolsd.service
#If this not work you can execute manually
sudo /usr/bin/vmtoolsd
#Instead use kill -9 -1 use:
#ps aux | grep -v 'grep\|vmtools' | awk '$2 ~ /^[0-9]+$/ {print $2}' | xargs -r kill -9


# eth0 ipv4 fix (VMware Workstation)
sudo ifconfig eth0 192.168.226.129 netmask 255.255.255.0 broadcast 192.168.226.255
sudo ip link set dev eth0 down
sudo ip link set dev eth0 up
sudo systemctl restart networking

# Permissions fix for user 'kali' on the target file
sudo chown kali:kali /home/kali/.config/bin/target

# Configure Spanish keyboard layout
sudo echo "setxkbmap es" >> ~/.zshrc

#Unzip rockyou.txt because its compressed for default
cd /usr/share/wordlists/
sudo gunzip rockyou.txt.gz

# Notify when installation is complete
notify-send "Installation complete. Your environment is ready."

# Exit the script
exit 0