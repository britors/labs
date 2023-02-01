#!/usr/bin/bash

# Instalando o WGet, Ansible e o Curl
sudo apt update
sudo apt install -y wget curl ansible
# Adiconando o repositório do Redis
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt update
# Instalando o Redis
sudo apt install redis -y
# Habilitando acesso remoto ao Redis
sudo sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0/g' /etc/redis/redis.conf
sudo sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf
# Reiniciando o Redis
sudo systemctl enable redis-server.service
sudo systemctl restart redis-server.service
# Atualizando o sistema
sudo apt upgrade -y