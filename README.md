# Star Intersect

Ce programme sert à l'intersection des données mrcs de 2 fichiers STAR 

## Haxe

### Installation

Il vous faut d'abord installer la version 3.4.7 de [Haxe](https://haxe.org/download/), puis installer les librairies [hxcpp](https://lib.haxe.org/p/hxcpp/) et [thx.core](https://lib.haxe.org/p/thx.core/).

### Compilation	

#### En python (version 3.7)

pour compiler le programme en Python : 
```
haxe build-py.hxml
```

#### En C++

Sur la distrib de votre choix (windows, mac ou linux), compiler le programme en CPP avec la commande suivante : 
```
haxe build-<distrib>.hxml
```
	
## Documentation

####	Usage
```
StarIntersect -f1 <fichier> -f2 <fichier> -o <fichier>
```
####	Options
```
- f1 <fichier> : Fichier du 1er dataset
- f2 <fichier> : Fichier du 2nd dataset
- o  <fichier> : Fichier de sortie de l'intersection
```
------------------------------

## Algorithme

Le programme charge les 2 fichiers .star et cherche les chemins .mrcs
à l'aide l'expression régulière suivante / ([0-9]+@.*\/.*)\.mrcs /

Le programme fait ensuite l'intersection des 2 tableaux de données.
Et sauvegarde les redondances dans le fichier de sortie.


	