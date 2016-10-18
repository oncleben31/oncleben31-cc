---
layout: post
title:  "Initiation au référencement : à lire avant de commencer son blog"
categories: article
tags: SEO
excerpt: "L'objectif est de donner une rapide initiation au concept d'optimisation de l'indexation par les moteurs de recherche appelé aussi référencement"
---

Je republie après mise-à-jour un article de l'ancienne version de mon blog concernant le référencement. L'objectif est de donner une rapide initiation aux concepts d'optimisation de l'indexation par les moteurs de recherche.

## Introduction


Je partage ici une constatation à propos des blogs et de l’optimisation de l’indexation par les moteurs de recherche (aussi appelé référencement ou SEO en anglais). Il y a quelques notions à bien comprendre avant de se lancer, car elles peuvent avoir un impact fort sur l’architecture de votre blog. D’autre part si vous deviez vous intéresser au référencement une fois votre site en place et rempli de contenu, les optimisations à faire vous obligeront sûrement à modifier le contenu et les URL de vos pages. Autant donc être sensibilisé à cette notion dès le départ.

Je ne vais pas rentrer dans les détails et dans la technique car le référencement est un métier à part entière qui se base sur de la théorie et surtout de l’expérimentation. Voilà donc les concepts à connaître.

## Les bases

__Les moteurs de recherche ne reférencent pas des sites mais des pages__. Ça peut paraître trivial comme information mais c’est important. Cela implique qu’il ne suffit pas de mettre en place une stratégie à la conception du site (comme soumettre un sitemap, revoir le format des titres des pages du site ou optimiser le contenu des headers de chaque page). Si le référencement de votre site est important, il faut y penser à chaque fois qu’une nouvelle page est ajoutée.

Dans la suite logique du premier point __la priorité est à mettre sur le contenu du site__. C’est votre atout majeur pour être bien référencé par les moteurs de recherche. Il y a quelques astuces données par les experts en SEO pour optimiser votre contenu.

*   La structure des permaliens doit être de la forme `/%postnames%/` ou `/%category%/%postnames%/`. Les autres sont inutiles car n’apportent pas d’infos utiles au référencement et rallonge vos URL.
*   Le slug (partie variable de votre URL) ne doit pas être trop long, doit contenir les mots clés importants et ne doit pas contenir de mots banales (un, de, le, pour, etc…).
*   Les mots clés importants de votre contenu doivent si possible être présent dans l’URL, dans le titre et dans les premières lignes de l’article.
*   Les premiers caractères de votre article seront repris par le moteur de recherche pour présenter votre page dans la liste des résultats. Il faut donc que les premiers mots donnent envie aux lecteurs de visiter votre site. Il est possible aussi de dire quelle phrase utiliser pour la description à l’aide d’une balise meta (voir plugin ci-dessous).

Il peut être très intéressant d’avoir __une page thématique__ qui redirige vers les contenus les plus intéressants et les plus fréquentés de votre site. Ce type de page devrait être bien placé dans les résultats des moteurs de recherche.

Il faut éviter le __contenu dupliqué__. Il peut arriver qu’un contenu soit accessible par l’intermédiaire de plusieurs URL différentes ou que des pages de votre site ont le même couple titre/description. Les moteurs de recherche n’aiment pas du tout. La cause racine principale de ce type de problème pour les blogs vient  des archives. Avec WordPress par exemple, on peut accéder aux archives temporelles, aux archives de catégories ou aux archives d’un auteur en particulier. Le risque que le contenu soit identique est fort. Il existe des solutions si vous ne pouvez pas faire autrement en ajoutant des balises meta. Je vous laisse chercher sur Internet pour avoir plus d’information à ce sujet.

__La vitesse de chargement des pages__ est importante pour le confort de vos lecteurs et pour le référencement par les moteurs de recherche. Les axes à connaître pour l’optimiser :

*   Si vous utilisez un CMS qui génère un site dynamique, __utilisez le moins de plugins possible__. C’est évident, ils peuvent vous faciliter la tâche, mais ils peuvent détériorer les performances. De nombreux plugins peuvent être remplacés par des modifications directement dans le thème du site. Dans WordPress, les thèmes enfants ont grandement facilité le travail dans les thèmes.
*   Si vous utilisez un CMS qui génère un site dynamique, __utilisez un plugin de cache__. Il en existe de nombreux et chacun a ces avantages. Je vous conseille de rechercher sur Internet pour trouver celui qui correspond à votre besoin.
*   Vous pouvez __renoncer aux CMS et opter pour un site statique__. Il y a de nombreuse solutions qui existent comme [Jekyll](https://jekyllrb.com/) (que j'utilise aujourd'hui pour ce blog). C'est comme si vous aviez une interface d'administration en local. Le framework s'occupe de générer le site et de le publier. Le résultat est un site avec des vitesses de chargement imbattables.

Quel que soit la solution retenue, il existe de nombreux plugins (pour Wordpress ou Jekyll) avec le tag SEO pour vous aider à optimiser votre référencement par les moteurs de recherche :

*   Du côté de WordPress, [WordPress SEO by Yoast](https://yoast.com/wordpress/plugins/seo/) est un des meilleurs à mon goût, car il propose une sorte de check liste, lors de la rédaction d’une page ou d’un article, qui vous permet d’optimiser votre contenu vis-à-vis du référencement.
*   Du coté de Jekyll, il y a moins de choix car pas mal de paramètres ayant un impact sur le référencement sont éditables lors de la création du contenu. Il y a le plugin [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) qui permet quand même de faciliter cette optimisation.

## Les nouveautés

Depuis la première publication de cet article, de nouveaux paramètres importants ont émmergé dans le référencement.

Le plus important est __la capacité de votre site à fonctionner sur des appareils mobiles__. On parle généralement de site "_responsive_" (comprendre _adaptable aux différents formats d'écran_). Les moteurs de recherche favoriseront les sites qui fonctionnent sur tous les appareils populaires.

Le second paramètre notable est __l'intégration de vos liens aux réseaux sociaux__. En effet les réseaux sociaux sont de plus en plus source de trafic, il est donc primordial d'optimiser la façon dont apparaissent les liens vers vos pages quand ils sont publiés sur ces réseaux. Je ne vais pas rentrer dans le détail, internet est votre ami pour approfondir ce sujet.

## Rester informé

Le dernier conseil que je pourrai donner : si vous voulez en savoir plus il faut lire régulièrement les sites spécialisés en SEO sur internet. Les moteurs de recherche changeant régulièrement leur algorithmes, il faut savoir réagir pour garder ses pages bien positionnées dans les résultats des moteurs de recherche.

__Liste de lecture non exhaustive et accessible aux débutants :__

*   [Seomix](http://www.seomix.fr/) et [Le blog de Florian Karmen](http://floriankarmen.com/) (en français)
*   [Yoast](http://yoast.com/) et le blog de [Matt Cutts](http://www.mattcutts.com/blog/type/googleseo/) (en anglais)

## En conclusion

J’espère que cette initiation sera utile à ceux qui débutent en leur permettant d'éviter de réaliser trop tard les optimisations nécessaires pour améliorer son référencement. Les autres, vous pouvez compléter ou corriger si nécessaire :wink:
