#!/usr/bin/bash

echo '***instalando ferramentas necessarias***'
sudo apt-get update
sudo apt-get install gnupg -y

# Instalando o Ansible
sudo apt install ansible -y


echo '***adicionando pacotes do mongodb***'
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo '***configurar o mongodb**'
sudo rm -f /etc/mongod.conf 
sudo cp /opt/database/config/mongod.conf  /etc/mongod.conf 

echo '***habilitando o serviço do mongodb***'
sudo systemctl enable mongod
sudo systemctl restart mongod

echo '***atualizando o SO***'
sudo apt-get update
sudo apt-get full-upgrade -y