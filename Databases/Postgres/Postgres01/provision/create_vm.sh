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
sudo cp /opt/database/config/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo cp /opt/database/config/postgresql.conf /etc/postgresql/12/main/postgresql.conf

# Ativando o PostgreSQL
sudo systemctl restart postgresql
