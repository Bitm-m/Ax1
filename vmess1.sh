#!/bin/bash

rm -f web config.json
wget -N https://raw.githubusercontent.com/Misaka-blog/AX/main/web
chmod +x ./web

if [[ -z $id ]]; then
    id="e319396c-c501-43a1-ace3-7d4ae2dc2b82"
fi

cat <<EOF > ~/config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": 443,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$id"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
		 "wsSettings": {
		"path": "/"
		}
            }
        }
    ],
	
	
	
    "outbounds": [
        {
            "protocol": "freedom"
			"settings": {}
        }
    ]
}
EOF

./web -config=config.json
