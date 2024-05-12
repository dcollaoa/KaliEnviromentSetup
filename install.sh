#!/bin/bash

# Update repositories and install updates
sudo apt update
sudo apt upgrade -y

# Timg show image files in Terminal 
# timg file.png
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

##########################Bloodhound###########################
# Installing JAVA (requirements)
sudo apt install openjdk-11-jdk -y
sudo apt install neo4j -y
# Start neo4j service
sudo neo4j console
# Configure neo4j (user:password neo4j:neo4j)
# Put new password (required)
cd ~/Downloads
wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip
unzip -q BloodHound-linux-x64.zip
sudo mv BloodHound-linux-x64 /bin/bloodhound
cd /bin/bloodhound
./BloodHound --no-sandbox
# Add alias to zshrc
echo "alias bloodhound='/bin/bloodhound/BloodHound'" >> ~/.zshrc
#################################################################

###########################DIRSEARCH#############################
#cd ~/opt/
#git clone https://github.com/maurosoria/dirsearch.git --depth 1
#cd dirsearch
#sudo pip3 install -r requirements.txt
#echo "alias dirsearch='~/opt/dirsearch/dirsearch.py'" >> ~/.zshrc
sudo apt install dirsearch #deprecated but still working 11/05/2024

# Ip fix
#sudo ifconfig eth0 192.168.226.129 netmask 255.255.255.0 broadcast 192.168.226.255
#sudo ip link set dev eth0 down
#sudo ip link set dev eth0 up
#sudo systemctl restart networking


#Install Powershell on Kali
###################################
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
#Error in Kali Linux instead use 6.0
sudo apt install dotnet-runtime-deps-7.0
sudo apt install mono-complete
###################################

# Permisos para el usuario kali en el archivo target
sudo chown kali:kali /home/kali/.config/bin/target

#Spanish Keyboard Fix
sudo echo "setxkbmap es" >> ~/.zshrc

# Notify when installation is complete
notify-send "Installation complete. Your environment is ready."

# Exit the script
exit 0


