# Debian Playbook

Cette repo contient le playbook ansible qui me permet d'installer et de configurer mon PC sous Debian.
Testé avec Debian 13.

## Procédure

Avant d'utiliser ansible pour configurer mon PC, il faut faire quelques étapes préalables.

Donner à l'utilisateur (patrick) les droits pour `sudo`

Passer en root :
```bash
su -
```

Ajouter patrick au groupe sudo :
```bash
/usr/sbin/usermod -aG sudo patrick
```

Il faut ré-ouvrir la session de patrick pour que le changement soit pris en compte
(ou rebooter la machine).

Installer rclone :
```bash
sudo apt-get update && sudo apt-get install curl -y
curl https://rclone.org/install.sh | sudo bash
```

Ajouter OneDrive à rclone :
```bash
rclone config create onedrive onedrive 
```
NOTA : nécessite de me connecter à mon compte Microsoft

Récupérer mes configurations linux (cryptées) :
```bash
mkdir -p ~/data/cloud/OneDrive/secure.enc
rclone copy onedrive:secure.enc ~/data/cloud/OneDrive/secure.enc
```

Décrypter mes configurations linux :
```bash
sudo apt-get install gocryptfs -y
mkdir -p ~/data/secure.clear
gocryptfs ~/data/cloud/OneDrive/secure.enc ~/data/secure.clear
```
NOTA : nécessite le mot de passe démandé par gocryptfs

Récupération de ma conf SSH :
```bash
chmod 700 ~/data/secure.clear/ssh
chmod 600 ~/data/secure.clear/ssh/*
rmdir ~/.ssh
ln -s ~/data/secure.clear/ssh ~/.ssh
```

Récupération de cette repo :
```bash
sudo apt-get install git -y
mkdir ~/dev
cd ~/dev
git clone git@github.com:PatBriPerso/my-computer-playbook.git
```

Récupération de la configuration pour mon PC de dev :
```bash
cd ~/dev/my-computer-playbook
cp ~/data/secure.clear/work-computer.config.yml config.yml
```


Installer pipx :
```bash
sudo apt-get update
sudo apt-get install -y pipx
pipx ensurepath
```

Puis ansible :
```bash
pipx install ansible-core==2.18
```

Je préfère bloquer la version sur 2.18 pour éviter les problèmes avec des
montées de version qui casseraient mon playbook.

Installer les rôles et les collections ansible nécessaires :
```bash
ansible-galaxy install -r requirements.yml
```

Créer un fichier de configuration (ou copier celui sauvegardé dans mon
cloud) :
```bash
cp config.example.yml config.yml 
```



Pour faire mes tests avec une machine virtuelle Virtual Box, je monte le
dossier partagé `zorin-playbook` dans `~/dev/zorin-playbook`.

Créer le répertoire :
```bash
mkdir -p /home/patrick/dev/zorin-playbook
```

Editer `/etc/fstab` pour ajouter la ligne :
```
# zorin-playbook repo
zorin-playbook  /home/patrick/dev/zorin-playbook  vboxsf  uid=1000,gid=1000,dmode=755,fmode=664 0 0
```


