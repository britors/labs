#!/usr/bin/bash

echo '***atualizando o SO***'
sudo apt-get update
sudo apt-get full-upgrade -y

echo '***instalando o docker***'
sudo snap install docker

echo '***instalando o microk8s***'
sudo snap install microk8s --classic

echo '***habilitando o microk8s***'
sudo usermod -a -G microk8s vagrant
mkdir ~/.kube
sudo chown -R vagrant ~/.kube
