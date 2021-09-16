# first_config

* Fichier : first_config.yaml
* Description : Ce script cloud-init permet d'executer quelques commandes lors de la création d'un serveur pour avoir un environnement déjà adapter pour travailler


## Description
Ce script sera jouer lors du premier démarrage de la VM nouvellement crée. 
Il installera les paquets :
* vim
* tmux

Il mettra à jours les paquets existants

Il crééra un user `mael`, qui sera ajouté au groupe `sudo`, il définira le mot de passe (fournis hashé ici).

Note:
pour génerer un hash de mot de passe:
```
mkpasswd --method=SHA-512 --rounds=4096
```

### Pré-requis
* Un cloud provider supportant cloud-init


### Fonctionnement
Ici je vais créer une VM sur GandiCloud VPS via le CLI Openstack, et lui passer en paramètre le fichier cloudinit

```
openstack server create --flavor V-R1 --image 47edd0a0-23ce-4ce5-9168-36de68990d1b --boot-from-volume 10 --key-name <nom_de_macle_ssh> --user-data first_config.yaml <nom_de_ma_vm>
```
où :
* `--flavor V-R1` : c'est le nom de la configuration du serveur chez Gandi (une VM avec 1CPU/1GB de RAM)
* `--image 47edd0a0-23ce-4ce5-9168-36de68990d1b` : l'id de l'image OS à utiliser, ici il s'agit de l'id d'une image Ubuntu 20.04.
* `-boot-from-volume 10`: la taille du volume à associer au serveur
* `--key-name <nom_de_macle_ssh>`: le nom de la clé SSH à associer au serveur. La clé SSH doit avoir été créée au préalable
* `--user-data first_config.yaml`: le nom du fichier cloud-init à executer lors du 1er démarrage
* `<nom_de_ma_vm>`: le nom que je souhaite donner à mon serveur à créer.

La création du serveur va prendre quelques minutes + quelques minutes également pour mettre à jour les paquets et réaliser l'ensemble des opérations.

### Plus d'info
La documentation officielle cloud-init: https://cloudinit.readthedocs.io/en/latest/topics/examples.html
