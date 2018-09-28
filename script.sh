#!/bin/bash
mkdir data
touch Vagrantfile

echo "# -*- mode: ruby -*-" >> ./Vagrantfile
echo "# vi: set ft=ruby :" >> ./Vagrantfile

echo "Vagrant.configure('2') do |config|" >> ./Vagrantfile
echo "config.vm.box = 'ubuntu/xenial64'" >> ./Vagrantfile

echo "quel ip souhaitez vous ajouter a votre serveur?"
read ipAdress
echo "config.vm.network 'private_network', ip: '$ipAdress'" >> ./Vagrantfile
echo "Avec quel dossier souhaiter vous le synchroniser ?"
read dossier
echo "config.vm.synced_folder './$dossier', '/var/www/html'" >> ./Vagrantfile

echo "end" >> ./Vagrantfile

touch ./$dossier/script2.sh

echo "#!/bin/bash" >> ./$dossier/script2.sh 
echo "sudo apt update" >> ./$dossier/script2.sh 
echo "sudo apt install apache2 -y" >> ./$dossier/script2.sh
echo "mkdir CSS JS" >> ./$dossier/script2.sh
echo "touch ./CSS/style.css" >> ./$dossier/script2.sh 
echo "touch ./JS/script.js" >> ./$dossier/script2.sh
echo "entrez le nom de l'utilisateur"
read user
echo "choisissez un mot de passe" 
read password
echo "sudo useradd -m $user  -p $password" >> ./$dossier/script2.sh 



vagrant up
vagrant ssh


