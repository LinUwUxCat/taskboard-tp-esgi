# Questions
- Quelle est la différence entre CI (Intégration Continue) et CD (Déploiement Continu) ?

La CI permet de faire les tests, build l'application et vérifier que tout se passe bien dans ces phases.

La CD permet de déployer l'application qu'on sait maintenant fonctionnelle sur un serveur de production.

- Qu'est-ce qu'un runner GitHub Actions ? Où s'exécute-t-il ?

Un runner est une machine (souvent virtuelle) qui exécute les étapes du workflow github actions. 

- Qu'est-ce qu'un artefact de pipeline ? Dans quels cas est-il utile ?

Un artefact de pipeline est un fichier généré pendant une étape du workflow et conservé après la fin de ce workflow. c'est utile par exemple pour conserver une build terminée pour avoir des builds "nightly" par exemple, mais aussi pour avoir un résultat de couverture de test, des fichiers de logs, etc.

- Comment les jobs peuvent-ils dépendre les uns des autres ?

Dans github actions, c'est avec la directive `needs:`, qui permet d'attendre la fin d'une étape pour en lancer une autre. On peut par exemple dire que l'étape `test` a une dépendance sur l'étape `build`

# Conception de la pipeline
- Quels stages votre pipeline doit-elle comporter ?
1. Lint
2. Test
3. Build & Publish
- Quels jobs dans chaque stage ?

Le stage de lint va avoir comme seul job lint, qui va récupérer les dépendances avec npm puis lancer le script de lint.

Le stage de test est similaire, il récupère les dépendances et lance le script de test.

Le stage Build & Publish a un job pour se connecter a ghcr.io, puis va build+push l'image docker vers le registre.
- Quelles dépendances entre jobs (`needs`) ?

Le job `lint` est le premier, il n'a donc pas de dépendances.

Le job `test` a pour dépendance `lint`

De même manière, le job `docker` (build & publish) a pour dépendance `test`.

- Sur quels événements la pipeline se déclenche-t-elle ?

Cette pipeline se lance sur un push sur la branche main.

- Certains jobs doivent-ils s'exécuter uniquement sur `main` ?

Ici non, mais si cette pipeline s'exécutait sur d'autres évènements (comme une pull request par exemple) il faudrait limiter le push de l'image sur le registre a un commit sur main.