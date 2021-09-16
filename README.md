# Boataoots

Ici une collection d'outils perso

## Terraform Gandi Server Creation
* Fichier : gandi_server_creation.tf
* Description : Ce Terraform permet simple de créer un serveur Gandi, avec Ubuntu, et un accès SSH pour s'y connecter.
### Description
Ce fichier Terraform va :
* Déployer un serveur GandiCloud V-R1 Server
* Avec une image Ubuntu 20.04
* Accessible en SSH à via une paire de clés définie au préalable
### Pré-requis
* Avoir Terraform installé en local sur son PC.
* Avoir son environnement CLI Openstack/Gandi configuré, avec les variables d'environnements correctement exportées
* Disposer déjà d'une paire de clé SSH renseignée sur la plateforme GandiCloud.

Enfin pour que ce Terraform s'execute automatiquement, il vous faut exporter la variable d'environnement suivante:
 - TF_VAR_SSH_PUBKEY : le nom de la paire de clé SSH qui sera associée au serveur.

Si vous n'avez pas exporté la variable d'environnement, le script vous demandera le nom de la paire de clé lors de son execution.
### Lancer le terraform
Récupérer le fichier `gandi_server_creation.tf` en local dans un répertoire, puis
```
terraform init
terraform plan
terraform apply
```

## Tri_alphab
Un script python qui va trier par ordre alphabétique les lignes d'un fichier texte

## Cloud-init
first_config: un script Cloud-init à jouer à la création d'une VM pour y apporter quelques réglages perso



