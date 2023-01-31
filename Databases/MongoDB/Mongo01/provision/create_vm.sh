#!/usr/bin/bash

echo '***instalando ferramentas necessarias***'
sudo apt update
sudo apt install gnupg -y

# Instalando o Ansible
sudo apt install ansible -y

# Instalando o MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org

# Configurando o MongoDB
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 192.168.56.20/' /etc/mongod.conf

# Habilitando o MongoDB
sudo systemctl enable mongod
sudo systemctl restart mongod

# Atualizando o sistema
sudo apt update
sudo apt full-upgrade -y