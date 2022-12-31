#!/usr/bin/bash

echo '***instalando ferramentas necessarias***'
sudo apt-get update
sudo apt-get install -y wget curl

echo '***adicionando pacotes do redis***'
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

echo '***instalando o redis***'
sudo apt-get update
sudo apt-get install redis -y