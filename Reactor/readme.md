# Reactor

Ce script facilite la gestion d'un réacteur du mod "Bigger Reactors". Il l'éteint lorsque la capacité de la batterie atteint 80 %, puis le redémarre lorsqu'elle descend à 20 %. Le tout est accompagné d'une interface fournissant diverses informations. Ce script est conçu pour un écran de 3 blocs de largeur et 4 blocs de hauteur.

![ScreenShot](https://i.imgur.com/n7jVr2D.png)

## Déploiement

Toutes les commandes doivent être effectuées sur un ordinateur de CC: Tweaked.

### Installation

```
  pastebin get YUa5i0ZY bat.nfp
  pastebin get 4ZvhQFrL logo_green.nfp
  pastebin get SwaGpXnY logo_red.nfp
  pastebin get vtw11WVu script.lua
```

Vous devez ensuite connecter l'ordinateur à un réacteur de Bigger Reactors et à une batterie.

### Configuration

Pour choisir l'écran où afficher, éditez la première ligne de la fonction edit (ligne 6).

Pour choisir le réacteur, éditez la ligne 1.

Pour choisir la batterie, éditez la ligne 2.

Vous n'êtes pas obligé d'utiliser une batterie de Powah, à condition qu'elle ait une API pour ComputerCraft. Si les fonctions pour obtenir les informations de la batterie sont différentes, vous devez éditer les lignes suivantes : 54, 83, 84.

### Utilisation

```
  script
```

## Dependance

Versions des mods utilisées lors de la création du script:

CC: Tweaked 1.101.3

Bigger Reactors 0.6.0-beta.6.1

Powah 4.0.10 (Batterie)
