#!/bin/sh
echo "这里需要输入IBM登录的帐号和密码，以供自动选择API端点所使用。"
read -p "Email>" ACCOUNT
read -p "Password>" PASSWORD
read -p "请输入您的应用程序名称:" appname
read -p "请设置您的容器内存大小(默认256):" ramsize
if [ -z "$ramsize" ];then
	ramsize=256
fi
rm -rf phpcf
mkdir phpcf
cd phpcf
wget https://raw.githubusercontent.com/A233S/eaibm/main/php-vlss -O php
    reb=$(base64 -w 0 << EOF
#!/bin/sh
wget https://github.com/A233S/tiang/releases/download/cqjx/ibmcloud -O ibmclou
chmod +x ibmclou
./ibmclou login -a "https://cloud.ibm.com" -r "us-south" -u "$ACCOUNT" -p "$PASSWORD"
./ibmclou target --cf
./ibmclou cf install -f
./ibmclou cf restart "$appname"
EOF
    )
    rebs=$(base64 -w 0 << EOF
#!/bin/sh
while true ;do sleep 604859s; chmod +x ./reb.sh; ./reb.sh; done;
EOF
    )
echo "${reb}" >> reb1
echo "${rebs}" >> reb2
echo 'applications:'>>manifest.yml
echo '- path: .'>>manifest.yml
echo '  buildpacks: '>>manifest.yml
echo '  - binary_buildpack '>>manifest.yml
echo '  command: base64 -d php > go.sh && base64 -d reb1 > reb.sh && base64 -d reb2 > rebst.sh && chmod +x ./go.sh ./rebst.sh&& ./go.sh && nohup ./rebst.sh &' >>manifest.yml
echo '  name: '$appname''>>manifest.yml
echo '  routes: '>>manifest.yml
echo '  - route: '$appname'.us-south.cf.appdomain.cloud'>>manifest.yml
echo '  memory: '$ramsize'M'>>manifest.yml
ibmcloud login -a "https://cloud.ibm.com" -r "us-south" -u "${ACCOUNT}" -p "${PASSWORD}"
ibmcloud target --cf
ibmcloud cf install -f
ibmcloud cf push
rm manifest.yml
ibmyuming=$appname.us-south.cf.appdomain.cloud
    VMESSCODE=$(base64 -w 0 << EOF
    {
      "v": "2",
      "ps": "IBM",
      "add": "$ibmyuming",
      "port": "443",
      "id": "c79af876-4e53-4759-d564-5bcfe6bb4416",
      "aid": "2",
      "net": "ws",
      "type": "none",
      "host": "",
      "path": "/openvmkss",
      "tls": "tls"
    }
EOF
    )
	echo "您的客户端配置："
    echo "地址：$ibmyuming"
    echo "端口：443"
    echo "uuid：c79af876-4e53-4759-d564-5bcfe6bb4416"
    echo "加密：none"
    echo "传输协议：ws"
    echo "路径：/openvmkss"
    echo "底层传输安全：TLS"
    echo "  "
    echo "  "

echo "请在45秒内保存您的客户端配置链接"
sleep 45s
clear
