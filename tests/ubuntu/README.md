# Ubuntu de test

Ce Dockerfile va créer une machine Ubuntu dans le but de faire des tests de déploiement si besoin.

Le fichier run.sh s'il est exécuté va créer la machine et ouvrir une console dessus.

il faut lancer manuellemment service ssh start
```service ssh start```

Si une machine du même nom existe déjà, il faudra la supprimer en la stoppant puis en éxécutnat la commande docker rm
- docker ps : récupération de ID
- docker stop ID
- docker rm ID