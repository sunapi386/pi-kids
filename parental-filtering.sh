# To set up content filtering and block harmful websites for kids, we can use OpenDNS Family Shield

# Install the necessary packages
sudo apt update
sudo apt install dnsmasq resolvconf -y

# Backup the original configuration file
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

# Configure dnsmasq to use OpenDNS Family Shield
echo "server=208.67.222.123
server=208.67.220.123
domain-needed
bogus-priv
no-resolv
no-poll" | sudo tee /etc/dnsmasq.conf

# Update resolv.conf to use localhost as the DNS server
echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf

# Ensure dnsmasq starts on boot
sudo systemctl enable dnsmasq

# Restart dnsmasq service
sudo systemctl restart dnsmasq

# Set DNS servers to localhost in dhcpcd.conf
echo "static domain_name_servers=127.0.0.1" | sudo tee -a /etc/dhcpcd.conf

# Reboot to apply changes
sudo reboot
