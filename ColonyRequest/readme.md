# ColonyRequest

Ce script se connecte à un réseau Refined Storage et permet d'exporter les items nécessaires dont un builder du mod "MineColonies" a besoin pour construire. S'il y a des recettes de craft dans le réseau, le script les lancera si nécessaire. Les informations affichées à l'écran vous permettront de savoir si l'export / craft s'est bien passé, et vous indiqueront les recettes manquantes.

![ScreenShot](https://i.imgur.com/jQ1f0en.png)

## Déploiement

Toutes les commandes doivent être effectuées sur un ordinateur de CC: Tweaked.

### Installation

```
  pastebin get Hu1Gb7d5 script.lua
```

Vous devez ensuite connecter l'ordinateur à un "Colony Integrator" d'Advanced Peripherals, à un bloc de stockage et à un réseau Refined Storage grâce à un "RS Bridge" (Advanced Peripherals).

### Configuration

Pour choisir l'écran où afficher, éditez la première ligne de la fonction edit (ligne 7).

Pour choisir le storage où exporter, éditez la ligne 1.

Pour choisir le colonyIntegrator, éditez la ligne 46.

Pour choisir le rsBridge, éditez la ligne 47.

Pour configurer la liste des builders, éditez la table à la ligne 2. Pour chaque builder, ajoutez la ligne suivante en remplaçant les coordonnées par celles du block "Builder's Hut":

```lua
{name="Vada I. Colby", x=-279, y=71, z=83}
```

### Utilisation

Afficher la liste des builders et leurs ID.

```
  script
```

Exporter les items depuis RS

```
  script <id>
```

## Dependanse

Version des mods utilisé a la création du script

CC: Tweaked 1.101.3

Refined Storage 1.11.6

Advanced Peripherals 0.7.29r

MineColonies 1.19.2-1.0.1489-BETA
