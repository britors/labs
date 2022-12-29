#!/usr/bin/bash

echo '***instalando ferramentas necessarias***'
sudo apt-get update
sudo apt-get install -y wget curl

echo '***adicionando pacotes do sql server***'
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
sudo apt-get update
sudo apt-get install -y mssql-server

echo '***configurando o sql server***'
sudo MSSQL_PID=Developer ACCEPT_EULA=Y MSSQL_SA_PASSWORD='SqlS3rver@123' /opt/mssql/bin/mssql-conf -n setup

echo '***habilitando o serviço do sql server***'
sudo systemctl enable mssql-server
sudo systemctl start mssql-server

echo '***adicionando pacotes do sql server tools***'
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update
sudo ACCEPT_EULA=Y  apt-get install mssql-tools unixodbc-dev -y

echo '***Preparando o ambiente***'
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
source ~/.bash_profile

echo '***rodando o script inicial***'
sqlcmd -S localhost -U SA -P SqlS3rver@123 -i /opt/database/scripts/createdatabase.sql -o log_create.txt

echo '***atualizando o SO***'
sudo apt-get update
sudo apt-get full-upgrade -y