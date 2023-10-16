#!/bin/bash

# wget -c https://raw.githubusercontent.com/zyhut200/x-uizz/main/install.sh && bash install.sh

username=admin
password=admin
port=8050

cd ~
wget -c https://raw.githubusercontent.com/zyhut200/x-uizz/main/x-ui-linux-amd64.tar.gz
wget -c https://raw.githubusercontent.com/zyhut200/x-uizz/main/tc
wget -c https://raw.githubusercontent.com/zyhut200/x-uizz/main/tc.sh

tar zxvf x-ui-linux-amd64.tar.gz
rm -f x-ui-linux-amd64.tar.gz
mv x-ui /usr/local/

cd /usr/local/x-ui
chmod +x x-ui bin/xray-linux-amd64

cp -f x-ui.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable x-ui

/usr/local/x-ui/x-ui setting -username $username -password $password
/usr/local/x-ui/x-ui setting -port $port
systemctl start x-ui

echo ""
echo ""
echo ========================
echo ui端口： 8050
echo 账号  ： admin
echo 密码  ： admin
echo ========================

cd ~
# 默认5Mbps
sh tc.sh 5000
echo ========================
echo "完成"
