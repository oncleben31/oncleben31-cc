---
layout: post
title:  "Déploiement de Jekyll sur Github Pages"
---
Jekyll et Github Pages sont étroitement liés. En effet, Github permet d'utiliser des sources Jekyll dans un repository pour générer automatiquement les pages HTML associées.
Conséquence, il est assez facile d'héberger gratuitement son site Jekyll grâce à Github Pages.

Avantages Github Pages:
*   hébergement gratuit sur ;
*   pas de maintenance d'un serveur ou de dépendances à gérer. Github s'occupe de tout ;
*   gestion de configuration et sauvegarde;
*   integration avec des outils d'intégration continue gratuitement ;
*   grosse communauté des éditeurs de sites basés sur Jekyll et hebergé sur Github Pages. Facile de voir les sources des autres et de demander de l'aide.

Inconvénients
*   Sauf si vous êtes un utilisateur payant, votre repository sur Github est publique. Vos sources sont donc visibles.
*   Github limite les plugins utilisables. Si vous voulez ou devez utiliser des plugins hors liste, vous ne pourez pas générer automatique votre site web à partir des sources. (un contournement est possible)
*   Si vous voulez utiliser votre propre nom de domaine, il sera associé à tous les répository de votre compte. (un contournement est possible)
*   Github gère sa propre liste de dépendances. Il se peut que la dernière version de certain module ne soit pas déployé immediatement. Exemple Jekyll 3.3.0
