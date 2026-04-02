# Questions
- Qu'est-ce qu'un secret dans le contexte d'une application web ?

c'est une valeur unique pour l'application qui sert lors de la sécurité et qui pourrait, si publique, permettre a n'importe qui de se connecter sous n'importe quel compte.

- Pourquoi est-il dangereux de commiter des secrets même dans un dépôt privé ?

pour plusieurs raisons, mais par exemple si le repo devient public, ou si les secrets sont, localement, uniques pour chaque personne qui travaille sur le projet

- Comment détecter si des secrets ont déjà été leakés dans l'historique Git ?

on peut utiliser des outils comme sonarqube

- Que se passe-t-il si vous supprimez le fichier `.env` mais que le commit initial est conservé dans l'historique ?

On peut restaurer l'état du projet a un commit présent dans l'historique, donc supprimer le .env sans supprimer le commit de l'historique ne sert a rien contre les personnes malintentionnées.

# Solutions
- Variables d'environnement système
    - Difficile a bien utiliser car possibilité que les variables changent sur les systèmes
- Fichiers `.env` avec `.gitignore` strict
    - Fonctionne bien mais le fallback est sur les variables d'environnement si fichier manquant (voir même un override)
- Secrets GitHub Actions (pour la CI/CD)
    - Bien pour la CI/CD mais unique par repo donc pas appropriée pour les cas ou l'environnement change (ex: mdp bdd)
- SOPS (Secrets OPerationS) avec chiffrement
    - Pratique mais l'import d'une clé PGP est nécéssaire
- HashiCorp Vault
    - Compliqué a faire
- Gestionnaires de secrets cloud (AWS Secrets Manager, GCP Secret Manager)
    - Bien pour le cloud correspondant mais inaccessible en dehors

# Mise en place
1. **Purger** les secrets de l'historique Git (recherchez la procédure appropriée — attention, c'est une opération destructive)

`git update-ref -d HEAD`

2. Créer un fichier `.env.example` documentant toutes les variables nécessaires **sans leurs valeurs**
3. Ajouter `.env` au `.gitignore` et vérifier qu'il n'est plus tracké
4. Choisir et mettre en place la solution adaptée au contexte du TP (CI/CD sur GitHub)
5. Vérifier que l'application démarre toujours correctement avec la nouvelle gestion des secrets

`git log --all --full-history -- .env` ne retourne rien.