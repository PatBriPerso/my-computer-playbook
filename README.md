# Zorin Playbook

Cette repo contient le playbook ansible qui me permet d'installer et de configurer mon PC sous Zorin OS.

## Procédure

Avant d'utiliser ansible pour configurer mon PC, il faut faire quelques étapes préalables.

Installer pipx puis ansible

```bash
sudo apt-get update
sudo apt-get install -y pipx
pipx ensurepath
```

```bash
pipx install ansible-core
```




sudo mount -t vboxsf -o uid=1000,gid=1000 zorin-playbook /home/patrick/dev/zorin-playbook

