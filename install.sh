# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install RetroPie for classic games
wget https://github.com/RetroPie/RetroPie-Setup/archive/master.zip
unzip master.zip
cd RetroPie-Setup-master
sudo ./retropie_setup.sh

# Install Minecraft Pi Edition
sudo apt install minecraft-pi -y

# Install additional games
sudo apt install supertux supertuxkart extremetuxracer -y

# Install Chromium browser (Chrome alternative for Raspberry Pi)
sudo apt install chromium-browser -y

# Install some educational games
sudo apt install gcompris -y

# Set up parental controls
sudo apt install opendns-updater -y
sudo dpkg-reconfigure opendns-updater

# Create a desktop shortcut for Minecraft
echo "[Desktop Entry]
Type=Application
Name=Minecraft
Exec=minecraft-pi
Icon=/usr/share/pixmaps/minecraft-pi.png
Categories=Game;" > ~/Desktop/minecraft.desktop
chmod +x ~/Desktop/minecraft.desktop

# Reboot the system
sudo reboot
