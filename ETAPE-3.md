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
<img width="307" height="117" alt="image" src="https://github.com/user-attachments/assets/1999ecc3-4b3e-46b3-a576-191d313b9f59" />

- npm run test:coverage : (un rapport est aussi produit dans le dossier coverage/)
<img width="795" height="371" alt="image" src="https://github.com/user-attachments/assets/4e01143f-08a9-4360-a52b-efbbf74ad42c" />

- npm run lint : 

<img width="213" height="112" alt="image" src="https://github.com/user-attachments/assets/2023e307-aad6-4261-b96d-aa43eb2e561f" />

aucun output, aucun problème.
