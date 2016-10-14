---
layout: post
title:  "Déploiement de Jekyll sur Github Pages"
---
__Jekyll__ et __Github Pages__ sont étroitement liés. En effet, Github permet d'utiliser des sources Jekyll dans un dépôt pour générer automatiquement les pages HTML associées.
Conséquence, il est assez facile d'héberger gratuitement son site Jekyll grâce à Github Pages.

Dans cette article je donne quelques astuces que j'ai utilisé pour réussir l'installtion d'un site basé sur minima sur Guthub Pages. Par contre je ne reprendrai pas toutes les étapes qui sont décrites à plein d'autres endroit sur Internet.

## Avantages et Inconvénients

Les avantages liés à l'utilisation de Github Pages sont:
*   l'hébergement est gratuit ;
*   il n'y a pas de maintenance du serveur ou de dépendances à gérer. Github s'occupe de tout ;
*   la gestion de configuration et la sauvegarde est garantie par construction (basée sur __Git__);
*   l'utilisation d'outils d'intégration continue est facile et gratuit ;
*   il y a une grosse communauté regroupant les éditeurs de sites basés sur Jekyll et hébergés sur Github Pages. Facile de voir les sources des autres et de demander de l'aide.

Les inconvénients liés à l'utilisation de Github Pages sont:
*   sauf si vous êtes un utilisateur payant, votre repository sur Github est public. Vos sources sont donc visibles.
*   Github limite les plugins utilisables. Si vous voulez ou devez utiliser des plugins autres que ceux autorisés par Github, vous ne pourrez pas générer automatique votre site web à partir des sources. (un contournement est possible)
*   Si vous voulez utiliser votre propre nom de domaine, il sera associé à tous les dépôts de votre compte. (un contournement est possible)
*   Github gère sa propre liste de dépendances. Il se peut que la dernière version de certain module ne soit pas déployé immédiatement. Exemple Jekyll 3.3.0
