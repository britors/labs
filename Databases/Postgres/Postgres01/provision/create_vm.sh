#!/bin/bash

# Atualizando o sistema
sudo apt update
sudo apt full-upgrade -y

# Instalando o Ansible
sudo apt install ansible -y

# Instalando o PostgreSQL
sudo apt install postgresql postgresql-contrib -y

# Configurando o PostgreSQL
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'Postgres@123';"
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/12/main/postgresql.conf
sudo sed -i 's/127.0.0.1\'/'32/0.0.0.0\'/'0/g' /etc/postgresql/12/main/pg_hba.conf

# Ativando o PostgreSQL
sudo systemctl restart postgresql
