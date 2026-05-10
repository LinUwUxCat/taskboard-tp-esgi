# Questions
- Pourquoi conteneuriser une application Node.js alors qu'on peut la lancer directement ?

si jamais il y a un virus dans une librairie (axios récemment mais bien d'autres par le passé...)

- Qu'est-ce que le concept de « build reproductible » et pourquoi est-il important ?

Pour s'assurer que tout le monde lance la même chose peu import l'environnement et la machine (dev, production, etc)

- Quelle est la différence entre une image de développement et une image de production ?

Une image de développement va contenir les dépendances dev (eslint, etc) alors que l'image de production sera réduite et sans dépendances dev

# Solutions
- Choix de l'image de base :
    - node:20 est l'image complète basée sur debian, elle contient beaucoup d'outils. Cependant cela augmente la surface d'attaque
    - node:20-slim est identique mais contient beaucoup moins d'outils installés (pas accès a certains utilitaires sur l'OS)
    - node:20-alpine est basée sur Alpine linux et est encore plus petite, quasiment tout ce que propose debian est absent. Le désavantage est que certains modules natifs node sont incompatibles et le build est plus long --> il vaut mieux build avec une autre image et lancer la build avec cette version
    - gcr.io/distroless/nodejs20 n'est basée sur rien : elle n'a pas d'OS inclus. Seulement nodejs et les runtimes minimaux sont inclus. La surface d'attaque est donc minimale, mais le debugging est assez compliqué.
- Stratégie de build 
    - Il vaut mieux faire un build multi-stage, la récupération des dépendances puis la build est effectuée avec node:20 ou node:20-slim et l'exécution est effectuée avec node:20-alpine ou distroless/nodejs20
- Sécurité de l'image 
    - utilisateur dédié
    - système de fichiers en lecture seule (on a besoin que d'une base de données de toute manière)
- Gestion des dépendances 
    - npm ci fait un clean avant l'install, on est donc sur que l'espace de travail est clean.
    - les devDependencies peuvent être exclues de la build, on en a pas besoin

# Critères de validation
- l'application se lance :

<img width="686" height="154" alt="image" src="https://github.com/user-attachments/assets/00f02051-4534-4f5e-9c73-e1050d8ca4cd" />

- L'image fait moins de 300mo (screenshot docker desktop) :

<img width="680" height="49" alt="image" src="https://github.com/user-attachments/assets/56b151b5-1774-46ee-a5f5-e4b2cd0bc89e" />



