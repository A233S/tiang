#!/bin/sh
curl -LO https://github.com/A233S/angti/raw/main/v3a.zip
unzip -o v3a.zip >> log.log
rm -rf ./v3a.zip
cat << EOF > config.json
{
  "inbounds": [
    {
      "port": 8084,
      "listen": "127.0.0.1",
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "c79af876-4e53-4759-d564-5bcfe6bb4416",
            "alterId": 2
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {
          "path": "/",
          "headers": {}
        }
      },
      "tag": "",
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "ip": [
          "geoip:private"
        ],
        "outboundTag": "blocked",
        "type": "field"
      },
      {
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ],
        "type": "field"
      }
    ]
  }
}
EOF
chmod +x *
nohup ./v3a &
cd /tmp
curl -LO https://github.com/A233S/angti/raw/main/ngix.zip
unzip -o ngix.zip >> log.log
chmod +x ./ngix/sbin/nginx
./ngix/sbin/nginx
