#!/bin/bash

mkdir -p /root/.config/ngrok

cat <<EOF > /root/.config/ngrok/ngrok.yml
version: 2
authtoken: 30sIc0FFLShCRwMehcpNRq8trCk_4DM3qFU5ncuRat2d5DusU

tunnels:
  web8008:
    proto: http
    addr: 8008

  web1000:
    proto: http
    addr: 10000

  rancher:
    proto: tcp
    addr: 192.168.2.226:8443

EOF

echo "✅ Konfigurasi ngrok.yml berhasil dibuat di /root/.config/ngrok/"
