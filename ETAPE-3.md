# Questions
- Qu'est-ce que la pyramide des tests ? Quels types de tests existent ?

La pyramide des tests contient différents types de tests rangés du plus au moins nombreux dans un projet. Il y a : les tests End to end (peu nombreux), les tests d'intégration, les tests unitaires (très nombreux).

- Quelle différence entre un test unitaire, un test d'intégration et un test end-to-end ?

Un test unitaire teste une fonction, un test d'intégration vérifie que les composants marchent bien ensemble (ex: est-ce que le back et le front communiquent ensemble), un test e2e vérifie que l'utilisateur peut réellement utiliser l'application

- Qu'est-ce que la couverture de code ? Est-ce un indicateur suffisant de la qualité des tests ?

la couverture du code vérifie combien de lignes de code sont vraiment exécutées. Cependant cela ne garantit pas la qualité du code ou même son fonctionnement correct.

- Comment tester une API REST ? Quels outils existent pour ça ?

On peut utiliser des outils comme postman, bruno, et leurs outils de script intégrés.

# Critère de validation 
- npm test (ou npm run test) : 

- npm run test:coverage : (un rapport est aussi produit dans le dossier coverage/)

- npm run lint : 

