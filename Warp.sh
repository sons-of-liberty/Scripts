#!/bin/bash
read -p "Enter Warp Plus Key: " warp_key

wget https://github.com/ViRb3/wgcf/releases/download/v2.2.22/wgcf_2.2.22_linux_amd64
mv wgcf_2.2.22_linux_amd64 /usr/bin/wgcf
chmod +x /usr/bin/wgcf
wgcf register
wgcf generate

sed -i "s/^license_key.*/license_key = '$warp_key'/" /usr/bin/wgcf-account.toml

wgcf update
wgcf generate

apt install -y wireguard; apt install -y wireguard-dkms; apt install -y wireguard-tools; apt install -y resolvconf
