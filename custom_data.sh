#!/bin/bash

export HOME=/root
export DOTNET_CLI_HOME=/root

apt-get update -y

apt-get install -y nginx git wget curl unzip mysql-client

wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

dpkg -i packages-microsoft-prod.deb

apt-get update -y

apt-get install -y dotnet-sdk-8.0
apt-get install -y aspnetcore-runtime-8.0

mkdir -p /opt/schoolapp

cd /opt/schoolapp

git clone https://github.com/putlurubharathreddy2002-dev/SCHOOL-APP.git .

dotnet restore

nohup env ASPNETCORE_URLS=http://0.0.0.0:5000 dotnet run > /opt/schoolapp/app.log 2>&1 &

systemctl enable nginx
systemctl start nginx