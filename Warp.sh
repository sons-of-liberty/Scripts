#!/bin/bash
read -p "Enter Warp Plus Key: " warp_key
read -p "Enter Endpoint: " endpoint
line_to_add="Table = off"

wget https://github.com/ViRb3/wgcf/releases/download/v2.2.22/wgcf_2.2.22_linux_amd64
mv wgcf_2.2.22_linux_amd64 /usr/bin/wgcf
chmod +x /usr/bin/wgcf
cd /usr/bin/
wgcf register


sed -i "s/^license_key.*/license_key = '$warp_key'/" /usr/bin/wgcf-account.toml

wgcf update
wgcf generate

apt install -y wireguard; apt install -y wireguard-dkms; apt install -y wireguard-tools; apt install -y resolvconf

sed -i "/\[Peer\]/i $line_to_add" /usr/bin/wgcf-profile.conf
sed -i '/:/d' /usr/bin/wgcf-profile.conf
echo "Endpoint = $endpoint" >> /usr/bin/wgcf-profile.conf

mv /usr/bin/wgcf-profile.conf /etc/wireguard/warp.conf
systemctl enable --now wg-quick@warp
