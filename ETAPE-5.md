# Questions
- Comment GitHub Actions peut-il se connecter à une machine locale derrière un NAT ?

Il faut faire du port forwarding au niveau du routeur, utiliser un VPN (pas trop possible avec github actions) ou bien utiliser un tunnel ssh.

- Qu'est-ce qu'un tunnel SSH ? Comment fonctionne le port forwarding inversé (`R`) ?

Un tunnel SSH permet de transporter du trafic réseau de manière sécurisée à travers une connexion SSH. Dans notre cas, github actions se connecte a un serveur public (localhost.run par exemple) qui lui va relayer la connexion jusqu'au serveur local.

- Qu'est-ce qu'un déploiement **idempotent** ? Pourquoi est-ce important ?

C'est un déploiement qui a le même résultat sur toutes les exécutions de ce déploiement. C'est important car les pipelines peuvent être relancées, un job peut être rejoué, etc.

- Qu'est-ce qu'un healthcheck post-déploiement ? Que doit-il vérifier ?

Un healthcheck vérifie que le conteneur est démarré, que l'application répond, que le bon port est utilisé, et possiblement d'autres choses spécifiques au cas d'utilisation (par exemple que l'API renvoie une réponse correcte)

# Lancement
Le serveur de déploiement local se trouve dans le dossier `deploy-server`.

Pour le lancer, il faut une paire de clés, la clé publique doit s'appeler `authorized_keys` et doit être placée dans le dossier ci-dessus.\
Vous pouvez vous connecter avec la clé privée avec par exemple `ssh -i my_private_key -p 2222 deploy@localhost`

Pour que le déploiement marche plus tard, il faut mettre la clé privée dans la variable SSH_PRIVATE_KEY sur github secrets.

Il faut également un host et un port dans les secrets github (SSH_HOST & SSH_PORT), par exemple `localhost.run` et `2222`