# Questions
> Quelles variables d'environnement sont nécessaires au fonctionnement ?

DATABASE_URL - l'url de la base de données avec nom d'utilisateur, mdp et base

PORT - Le port de l'application

JWT_SECRET - Le secret jwt

> Quels services externes l'application requiert-elle ?

PostgreSQL

> Quels scripts sont disponibles dans ``package.json`` ?

`start`: Lance le serveur, `dev` : lance le serveur et le relance a chaque modification dans le code, `test` : lance jest, pour lancer tous les tests, `test:coverage` : lance jest et fait un rapport avec la couverture du code après les tests, et `lint` : formatte le code dans le dossier src/.

> Y a-t-il des problèmes évidents de sécurité dans le code existant ?

pas vu

# Observations

ptdr jsp