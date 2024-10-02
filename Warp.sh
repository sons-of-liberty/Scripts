#!/bin/bash


wget https://github.com/ViRb3/wgcf/releases/download/v2.2.22/wgcf_2.2.22_linux_amd64
mv wgcf_2.2.22_linux_amd64 /usr/bin/wgcf
chmod +x /usr/bin/wgcf
cd /usr/bin/
wgcf register
wgcf generate

apt install -y wireguard; apt install -y wireguard-dkms; apt install -y wireguard-tools; apt install -y resolvconf
sed -i '/\[Peer\]/i\
Table = off' /usr/bin/wgcf-profile.conf
mv /usr/bin/wgcf-profile.conf /etc/wireguard/warp.conf
systemctl enable --now wg-quick@warp
