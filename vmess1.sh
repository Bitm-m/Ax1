#!/bin/bash

rm -f web config.json
wget -N https://raw.githubusercontent.com/Misaka-blog/AX/main/web
chmod +x ./web

if [[ -z $id ]]; then
    id="1eb6e917-774b-4a84-aff6-b058577c60a5"
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
            },
            "streamSettings": {
                "network": "ws",
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
