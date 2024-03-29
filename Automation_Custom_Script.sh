#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get -yqq update || apt-get -yqq update
apt-get -yqq install wireguard qrencode dnsutils rsync

mkdir /var/lib/apt/periodic

cat <<EOF > /etc/wireguard/wg.conf
[Interface]
PrivateKey = D8ZEb7enMN7gD6gQ7gEQjmUFUS9c+WSQK7SezhRDAIc=
Address = 212.58.85.57/32

[Peer]
PublicKey = tdVDRsDmTHoIOSFciDqd+yz3y5cHaTtKganxU1sl7AM=
AllowedIPs = 0.0.0.0/0
Endpoint = 212.58.69.12:51820
EOF

systemctl enable --now wg-quick@wg
