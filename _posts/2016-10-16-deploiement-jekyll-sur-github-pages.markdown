---
layout: post
title:  "Déploiement de Jekyll sur Github Pages"
categories: article
tags: [github, jekyll]
excerpt:
---
__Jekyll__ et __Github Pages__ sont étroitement liés. En effet, Github permet d'utiliser des sources Jekyll dans un dépôt pour générer automatiquement les pages HTML associées. Le site sera alors accessible à une adresse du type `your_pseudo.github.io`.

Conséquence, il est assez facile d'héberger gratuitement son site Jekyll grâce à Github Pages.

Dans cet article, je donne quelques astuces que j'ai utilisées pour réussir l'installation d'un site Jekyll avec le thème minima sur Github Pages. Par contre, je ne reprendrai pas toutes les étapes qui sont décrites à plein d'autres endroits sur Internet.

## Avantages et Inconvénients

Pour commencer une petite comparaison des avantages et inconvénients liées au choix d'héberger son Jekyll sur Github Pages. Vous trouverez ci-dessous des évidences mais aussi des subtilités que j'ai découvertes en testant ou creusant certaines fonctionnalités.

Les avantages liés à l'utilisation de Github Pages sont:

*   l'hébergement est gratuit ;
*   il n'y a pas de maintenance du serveur ou de dépendances à gérer. Github s'occupe de tout ;
*   la gestion de configuration et la sauvegarde est garantie par construction (basée sur __Git__) ;
*   l'utilisation d'outils d'intégration continue est facile et gratuit ;
*   il y a une grosse communauté regroupant les éditeurs de sites basés sur Jekyll et hébergés sur Github Pages. Facile de voir les sources des autres et de demander de l'aide.

Les inconvénients liés à l'utilisation de Github Pages sont:

*   sauf si vous êtes un utilisateur payant, votre dépôt sur Github est public. Vos sources sont donc visibles ;
*   Github limite les plugins utilisables. Si vous voulez ou devez utiliser des plugins autres que ceux autorisés par Github, vous ne pourrez pas générer automatique votre site web à partir des sources. (un contournement est possible) ;
*   si vous voulez utiliser votre propre nom de domaine, il sera associé à tous les dépôts de votre compte. (un contournement est possible) ;
*   Github gère sa propre liste de dépendances. Il se peut que la dernière version de certain modules ne soit pas déployé immédiatement. Exemple Jekyll 3.3.0 sortie le 6 octobre 2016 n'est toujours pas disponible dans la gem github-pages.

## Les patchs

Lorsque j'ai commencé la mise en place de ce blog. La gem github-pages était en version v97 et basée sur jekyll v3.2.1 et minima v1.2.0.
Le theme minima dans cette version avait besoin d'être modifié pour fonctionner correctement en local. Mes patchs sont disponibles dans les commits suivants :

*   046abe81ffb0f88c698cb6b5c10f5a489ce6a14d
*   c5f4ca38e4d81a4e822f4e3f0b9cbe8a00a781cb

Ces correctifs sont inclus depuis la version v2.0.0 de minima.

## Le paramétrage

Il y a une astuce pour que le site fonctionne en local et sur Github Pages. Ma solution consiste a utiliser deux fichiers de configuration:

*   `_config.yml` qui contient le paramétrage pour l'environnement de production
*   `_config.dev.yml` qui contient une surcharge de deux paramètres pour garantir le fonctionnement en local.

Le fichier `_config.dev.yml`:

```yaml
# config for local testing
# use it with: bundle exec jekyll serve --host 0.0.0.0 --config _config.yml,_config_dev.yml

baseurl: "" # the subpath of your site, e.g. /blog
url: "" # the base hostname & protocol for your site
```

Pour utiliser ce double paramétrage il faut lancer lee serveur local avec la commande:

```bash
bundle exec jekyll serve --config _config.yml,_config_dev.yml
```

## La branche

Dans la documentation on trouves une contrainte historique qui consiste à demander l'installation des sources Jekyll dans la branche `gh-pages`. En faite, vous pouvez mettre vos sources dans n'importe quelle branche à partir du moment où vous l'indiquez dans les paramétrages de votre dépôt.

Je trouve que la branche `master` est plus pratique dans le cadre de mon blog.

## Les contournements

J'ai listé, plus haut, quelques inconvénients qui sont contournables.

### Github Pages et plugins

Le premier contournement concerne les plugins qui ne sont pas toléré par Github Pages. Le contournement consiste à continuer à gérer ses sources sur Github (sur la branche master par exemple), mais faire la génération des pages a l'extérieurs de Github et de les synchroniser avec la branche gh-pages. La génération pouvant se la faire manuellement en local sur votre machine, ou automatiquement avec un outil d'intégration continue comme [Travis CI](http://travis-ci.org) par exemple.

Si vous voulez allez plus loin dans ce type de solution je vous conseille de regarder [le Gist de Domenic Denicola](https://gist.github.com/domenic/ec8b0fc8ab45f39403dd).

### Github Pages et nom de domaine
Le second contournement concerne le nom de domaine. Il est relativement facile d'acheter un nom de domaine et de le rediriger vers Github pour remplacer les URL du type `votre_pseudo.github.io/votre_depot`. Par contre, tous les dépôt de votre compte utilisant Github Pages seront accessibles sur votre nom de domaine. Le contournement consiste à créer une organisation pour votre projet. D'héberger le dépôt de votre site avec cette organisation et de diriger votre nom de domaine vers le dépôt de l'organisation. Ainsi le nom de domaine ne sera pas pollué par vos autres dépôts.
