---
layout: post
title:  "Jekyll dans une machine virtuelle avec Vagrant et VirtualBox"
categories: article
tags: [jekyll, vagrant]
---
## Pourquoi ?

En faisant complètement autre chose, je suis tombé sur une [présentation de Jekyll ainsi qu'une comparaison entre cet outil permettant de faire des blogs statiques et Wordpress](http://digitalshore.io/jekyll-better-choice-than-joomla-wordpress/). Je suis rapidement convaincu par l'argumentaire et ça me donne envie de ressusciter oncleben31.cc

Et hop ! Me voilà lancé dans la découverte de cet outil et des différentes manières de l'utiliser.

Sur le même blog qui m'a fait découvrir Jekkyl, j'ai lu un article [expliquant les avantages de travailler avec une machine virtuelle](http://digitalshore.io/set-up-a-local-linux-development-environment-with-vagrant/) :

*   on évite les conflits avec les outils et binaires de notre OS ;
*   on peut customiser les versions de nos outils, binaires ou dépendances en fonction des projets en cours de développement ;
*   on peut calquer l'environnement de production d'un fournisseur d'hébergement pour éviter de découvrir des problèmes de compatibilité pendant le déploiement ;
*   il est possible de synchroniser des fichiers entre la VM et l'OS de votre machine.

Mais là où c'est vraiment fort c'est que grâce à Vagrant, la construction et le paramétrage de la machine virtuelle est complètement automatisée. Ainsi le paramétrage des machines virtuelles utilisées est facile à sauvegarder et rétablir en cas de besoin.

## Comment ?

### Téléchargements et Installations
*   [Vagrant](https://www.vagrantup.com/)
*   [VirtualBox](https://www.virtualbox.org/)

Vous pouvez utiliser un autre moteur de machine virtuelle si vous voulez. L'avantage de celui-ci est qu'il est open source et populaire.

### Paramétrage de la machine virtuelle.
L'idée c'est de partir de rien ! Créez le répertoire qui va héberger votre VM et initiez le fichier de paramétrage `Vagrantfile`.
{% highlight shell %}
mkdir monProjet-vm
cd monProjet-vm
touch Vagrantfile
{% endhighlight %}
Vous trouverez plus bas un exemple avec le fichier `Vagrant` que j'utilise en ce moment.

### On lance la création et le démarrage de la VM
{% highlight shell %}
vagrant up
{% endhighlight %}
Lors du premier lancement la VM sera créée. C'est-à-dire que l'image sera téléchargée, ensuite la VM sera lancée et toutes les dépendances paramétrées seront installées.
Lors des lancements suivants, la VM sera juste démarrée.

### On se connecte à la VM en SSH
{% highlight shell %}
vagrant ssh
{% endhighlight %}

### Enjoy ;-)
Vous êtes connecté ! A vous de bosser.
Le but de cet article n'est pas d'expliquer finement comment utiliser Vagrant. Il y a d'autres tutoriels de disponibles. Vous pouvez commencer par l'article du site [DigitalShore
](http://digitalshore.io/set-up-a-local-linux-development-environment-with-vagrant/) que j'ai utilisé pour découvrir Vagrant.

## Exemple de Vagrantfile & astuces

### Mon Vagrantfile
{% highlight ruby %}
# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Box / OS
VAGRANT_BOX = 'ubuntu/trusty64'

# Memorable name for your VM
VM_NAME     = 'oncleben31cc-vm'

# VM User - 'vagrant' by default
VM_USER     = 'vagrant'

# Username on your Mac
MAC_USER    = 'yourUsername'

# Host folder to sync
HOST_PATH   = '/Users/' + MAC_USER + '/pathToYourFolder/' + VM_NAME

# Where to sync to on Guest - 'vagrant' is the default user name
GUEST_PATH  = '/home/' + VM_USER + '/' + VM_NAME

# # VM Port - uncomment this to use NAT instead of DHCP
# VM_PORT   = 8080


Vagrant.configure(2) do |config|

  # Vagrant box from Hashicorp
  config.vm.box = VAGRANT_BOX

  # Actual machine name
  config.vm.hostname = VM_NAME

  # Set VM name in Virtualbox
  config.vm.provider "virtualbox" do |v|
    v.name = VM_NAME
    v.memory = 512
  end

  # Set the timezone to the host timezone
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = :host
  end

  #DHCP -- comment this out if planning on using NAT instead
  #config.vm.network "private_network", type: "dhcp"

  # # Port forwarding -- uncomment this to use NAT instead of DHCP
  config.vm.network "forwarded_port", guest: 4000, host: 4000, host_ip: "127.0.0.1"

  # Sync folder
  config.vm.synced_folder HOST_PATH, GUEST_PATH

  # Disable default Vagrant folder, we'll use a unique path per project
  config.vm.synced_folder '.', '/home/' + VM_USER + '', disabled: true

  # Install Apache, Git, Ruby 2.3.x, and Jekyll Gems
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
    apt-get install -y git

    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update
    apt-get install -y ruby2.3
    apt-get install -y ruby2.3-dev
    #gem install jekyll
    gem install bundler
    #gem install jekyll-paginate

    #Pour github pages
    apt-get install -y build-essential patch
    apt-get install -y ruby-dev zlib1g-dev liblzma-dev
    apt-get install -y nodejs
  SHELL

end
{% endhighlight %}

Comparé au fichier fourni sur le site de DigitalShore, j'ai ajouté :

*   une référence à un plugin pour synchroniser le fuseau horaire (cf. plus bas) ;
*   une référence au Gem `Bundler` qui est utilisé dans l'installation et le déploiement de Jekyll depuis je ne sais plus quelle version.
*   plusieurs lignes nécessaire au fonctionnement de Jekyll hébergé sur Github grâce au gem github-pages.


### Résoudre les erreurs liées au VirtualBox "Guest Additions"
Si vous regardez attentivement les différents messages affichés lors du démarrage de la VM, vous devriez voir des messages d'avertissement du type:

`The guest additions on this VM do not match the installed version of VirtualBox!`

Une solution consiste à faire appel à un plugin Vagrant qui s'occupera de résoudre le problème tout seul: [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

### Synchroniser le fuseau horaire
Jekyll utilise la date courante pour savoir si un post doit être publié ou non. Tous les articles qui ont une date dans le futur sont ignorés. Cela m'a posé quelques problèmes, car par défaut, la machine virtuelle n'est pas sur le même fuseau horaire.
Une solution consiste à installer le plugin Vagrant  [vagrant-timezone](https://github.com/tmatilai/vagrant-timezone) et à ajouter le code suivant dans le `Vagrantfile` :

{% highlight ruby %}
# Set the timezone to the host timezone
if Vagrant.has_plugin?("vagrant-timezone")
  config.timezone.value = :host
end
{% endhighlight %}

## Installation de Jekyll et création de votre premier blog statique
Il n'y a pas vraiment d'installation, car Vagrant s'est chargé d'installer toutes les dépendances lors de la création de la VM.

Pour créer votre premier site avec Jekyll

{% highlight shell %}
vagrant up
vagrant ssh
cd /chemin/vers/le/repertoire/contenant/les/sources/de/votre/site
jekyll new mon-super-site-statique
cd mon-super-site-statique
bundle install
bundle exec jekyll serve --host=0.0.0.0 --force_polling
{% endhighlight %}  


La dernière ligne est un peu différente de ce qui est indiqué [sur le site officiel de Jekyll](https://jekyllrb.com/). Les deux derniers arguments permettent de rendre le serveur jekyll accessible depuis l'extérieur de la VM et rendre la régénération des pages, sur la detection d'un changement de fichier, fonctionnelle.

Il ne reste donc plus qu'à utiliser votre navigateur préféré pour consulter l'url  `http://127.0.0.1:4000`.

Au moment où j'écris cet article, il y a un bug avec le thème minima par défaut. Si vous avez l'impression que votre feuille de style CSS n'est pas appliquée, allez éditer le fichier `_config.yml` et remplacez :
{% highlight ruby %}
url: "example.com"
{% endhighlight %}
par:
{% highlight ruby %}
url: ""
{% endhighlight %}

A vous de jouer maintenant pour personnaliser votre site. Je vous conseille de lire la [documentation](https://jekyllrb.com/docs/home/) pour bien débuter.
